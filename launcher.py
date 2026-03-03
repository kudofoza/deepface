from apps.DeepFaceLive.DeepFaceLiveApp import DeepFaceLiveApp

def main():
    print("Starting Custom Deepface Pipeline")

    app = DeepFaceLiveApp()

    # тут можна задати кастомні параметри
    app.run()

if __name__ == "__main__":
    main()