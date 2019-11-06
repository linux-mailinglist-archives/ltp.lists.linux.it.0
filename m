Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8E8F166C
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 13:57:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D8973C23CB
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 13:57:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1650B3C13DE
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 13:57:46 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B9446605636
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 13:57:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 722C3B386
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 12:57:44 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  6 Nov 2019 13:57:43 +0100
Message-Id: <20191106125743.29952-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106125743.29952-1-mdoucha@suse.cz>
References: <20191106125743.29952-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] Create full path to workdir in fs/doio/growfiles.c
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

LVM runfile sets the work directory for growfiles to /test/growfiles/[fsname].
If the /test/growfiles directory doesn't exist, the test will fail.

Fix the error by creating the full path.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/fs/doio/growfiles.c | 71 +++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 18 deletions(-)

diff --git a/testcases/kernel/fs/doio/growfiles.c b/testcases/kernel/fs/doio/growfiles.c
index eb58ce0cd..c0109ffcb 100644
--- a/testcases/kernel/fs/doio/growfiles.c
+++ b/testcases/kernel/fs/doio/growfiles.c
@@ -114,6 +114,7 @@ int check_write(int fd, int cf_inter, char *filename, int mode);
 int check_file(int fd, int cf_inter, char *filename, int no_file_check);
 int file_size(int fd);
 int lkfile(int fd, int operation, int lklevel);
+int mkpath(const char *path, mode_t mode);
 
 #ifndef linux
 int pre_alloc(int fd, long size);
@@ -380,7 +381,6 @@ int main(int argc, char **argv)
 	long total_grow_value;	/* used in pre-allocations */
 #endif
 	int backgrnd = 1;	/* return control to user */
-	struct stat statbuf;
 	int time_iterval = -1;
 	time_t start_time = 0;
 	char reason[128];	/* reason for loop termination */
@@ -481,23 +481,11 @@ int main(int argc, char **argv)
 #ifdef CRAY
 			unsetenv("TMPDIR");	/* force the use of auto_dir */
 #endif
-			if (stat(auto_dir, &statbuf) == -1) {
-				if (mkdir(auto_dir, 0777) == -1) {
-					if (errno != EEXIST) {
-						fprintf(stderr,
-							"%s%s: Unable to make dir %s\n",
-							Progname, TagName,
-							auto_dir);
-						exit(1);
-					}
-				}
-			} else {
-				if (!(statbuf.st_mode & S_IFDIR)) {
-					fprintf(stderr,
-						"%s%s: %s already exists and is not a directory\n",
-						Progname, TagName, auto_dir);
-					exit(1);
-				}
+			if (!mkpath(auto_dir, 0777)) {
+				fprintf(stderr,
+					"%s%s: Unable to make dir %s\n",
+					Progname, TagName, auto_dir);
+				exit(1);
 			}
 			break;
 
@@ -3019,6 +3007,53 @@ int lkfile(int fd, int operation, int lklevel)
 	return 0;
 }
 
+int mkpath(const char *path, mode_t mode)
+{
+	struct stat statbuf;
+	size_t pathlen = strlen(path), pos;
+	char *pathbuf = malloc(pathlen + 1);
+
+	strcpy(pathbuf, path);
+
+	// Strip trailing slashes from path
+	for (pos = pathlen - 1; pos > 0 && pathbuf[pos] == '/'; pos--,
+		pathlen--) {
+		pathbuf[pos] = '\0';
+	}
+
+	// Find the longest existing section of the path
+	for (pos = pathlen; pos > 0;) {
+		if (!stat(pathbuf, &statbuf)) {
+			if (!(statbuf.st_mode & S_IFDIR)) {
+				fprintf(stderr,
+					"%s%s: %s already exists and is not a directory\n",
+					Progname, TagName, pathbuf);
+				free(pathbuf);
+				return 0;
+			}
+
+			break;
+		}
+
+		while (pos > 0 && pathbuf[--pos] != '/');
+		pathbuf[pos] = '\0';
+	}
+
+	// Create missing directories
+	while (pos < pathlen) {
+		pathbuf[pos] = '/';
+		while (pathbuf[++pos]);
+
+		if (mkdir(pathbuf, mode)) {
+			free(pathbuf);
+			return 0;
+		}
+	}
+
+	free(pathbuf);
+	return 1;
+}
+
 #ifndef linux
 /***********************************************************************
  *
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
