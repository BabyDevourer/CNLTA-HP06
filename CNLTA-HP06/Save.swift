//
//  SaveButton.swift
//  GreetingCardApp
//
//

import SwiftUI
import Photos
import UIKit

struct SaveButton: View {
    let imageName: String
    let greetingMessage: String
    var textColor: Color = .white
    var fontSize: CGFloat = 48

    @State private var isSaving = false
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        Button(action: saveCard) {
            HStack {
                if isSaving { ProgressView().padding(.trailing, 6) }
                Text("Save Card to Photos")
                    .font(.headline)
            }
            .padding(10)
            .frame(maxWidth: 200)
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(0)

        }
        .disabled(isSaving)
        .padding(.horizontal)
        .alert("Save Card", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }

    // MARK: - Save Logic
    private func saveCard() {
        // Avoid trying to ask Photos permission while running in Xcode Previews
        let isInPreviews = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"

        isSaving = true

        // 1) Render the card to a UIImage
        let targetSize = CGSize(width: 1080, height: 1350)
        let renderer = ImageRenderer(content:
            ZStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .clipped()
                Text(greetingMessage)
                    .font(.system(size: fontSize, weight: .bold))
                    .foregroundColor(textColor)
                    .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .frame(width: targetSize.width, height: targetSize.height)
        )
        renderer.scale = 1

        guard let image = renderer.uiImage else {
            alertMessage = "Could not render your card. Please try again."
            isSaving = false
            showAlert = true
            return
        }

        // 2) If running in previews, don't touch Photos (no permissions there)
        if isInPreviews {
            alertMessage = "Preview mode: rendered image (not saved to Photos)."
            isSaving = false
            showAlert = true
            return
        }

        // 3) Ask for Photos (Add Only) permission and save
        if #available(iOS 14, *) {
            PHPhotoLibrary.requestAuthorization(for: .addOnly) { status in
                switch status {
                case .authorized, .limited:
                    saveUIImageToPhotos(image)
                default:
                    finish(with: "Permission denied. Enable Photos access to save cards.")
                }
            }
        } else {
            // Older iOS – still attempt to save (requires usage description key)
            saveUIImageToPhotos(image)
        }
    }

    private func saveUIImageToPhotos(_ uiImage: UIImage) {
        // Use Photos framework to create an asset
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAsset(from: uiImage)
        }) { success, error in
            if success {
                finish(with: "Your card was saved to Photos.")
            } else {
                finish(with: "Failed to save: \(error?.localizedDescription ?? "Unknown error").")
            }
        }
    }

    private func finish(with message: String) {
        DispatchQueue.main.async {
            self.alertMessage = message
            self.isSaving = false
            self.showAlert = true
        }
    }
}

#Preview {
    // Previews won't try to save to Photos; you'll see a friendly message instead.
    SaveButton(imageName: "birthdayConfetti", greetingMessage: "Chúc Mừng Năm Mới!", textColor: .yellow, fontSize: 48)
        .padding()
}
