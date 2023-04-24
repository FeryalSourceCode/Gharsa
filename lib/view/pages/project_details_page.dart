import 'package:flutter/material.dart';

class ProjectDetails extends StatelessWidget {
  final int projectId;
  const ProjectDetails({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Details"),
        centerTitle: true,
      ),
      body: Text("The index is: $projectId"),
    );
  }
}
