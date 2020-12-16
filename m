Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6F92DC23B
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 15:32:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A44C13C580B
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 15:32:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id DB8D73C57F4
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 15:32:54 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 67B7E200C76
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 15:32:54 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CAAC0AD35
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 14:32:53 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 16 Dec 2020 15:32:44 +0100
Message-Id: <20201216143244.8180-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] Docparse: Escape | in table content
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

31708e815 added | in values displayed in table, which unescaped breaks
table formatting.

NOTE: Due asciidoc{,tor} markup design it's difficult to easily escape markup
handling only this particular case.

https://github.com/asciidoctor/asciidoctor/issues/901
https://discuss.asciidoctor.org/Difficulty-in-consistently-escaping-markup-td5318.html

Fixes: #754

Reported-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 docparse/testinfo.pl | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/docparse/testinfo.pl b/docparse/testinfo.pl
index d8d9ea663..5aa7315e4 100755
--- a/docparse/testinfo.pl
+++ b/docparse/testinfo.pl
@@ -119,6 +119,14 @@ sub table
 	return "|===\n";
 }
 
+sub table_escape
+{
+	my $out = $_[0];
+
+	$out =~ s/\|/\\|/g;
+	return $out;
+}
+
 sub print_defined
 {
 	my ($key, $val, $val2) = @_;
@@ -329,10 +337,11 @@ sub content_all_tests
 
 			$content .= "|" . tag2title($k) . "\n|";
 			if (ref($v) eq 'ARRAY') {
-				$content .= join(', ', @$v),
+				$content .= table_escape(join(', ', @$v));
 			} else {
-				$content .= $v;
+				$content .= table_escape($v);
 			}
+
 			$content .= "\n";
 
 			$tmp2 = 1;
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
