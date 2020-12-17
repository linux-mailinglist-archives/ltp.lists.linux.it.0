Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 552692DD124
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 13:15:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 08B8F3C4CAF
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 13:15:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 91AA43C2A9D
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 13:15:27 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DDDBD200E0A
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 13:15:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 51EBBACF9
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 12:15:26 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 17 Dec 2020 13:15:19 +0100
Message-Id: <20201217121520.25713-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217121520.25713-1-pvorel@suse.cz>
References: <20201217121520.25713-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] docparse/parse.sh: Fix parsing on dash
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

bash keeps escape sequences (e.g. \t and \n) when using echo:

$ a="-v\tverbose output\n"; echo "$a"
-v\tverbose output\n
$

But dash interprets them (behaves like echo -e on bash):

$ a="-v\tverbose output\n"; echo -e "$a"
-e -v	verbose output

$

Using printf does not help, because it'd have to be separated with --
which cannot be used for printing variables.
Fortunately cat << EOF redirection is portable.
In the future we should probably avoid shell as much as possible.

Fixes: 0962c9a37 ("syscalls/perf_event_open02: Use anonymous .options")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 docparse/parse.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/docparse/parse.sh b/docparse/parse.sh
index 4ae0c42b2..172eab702 100755
--- a/docparse/parse.sh
+++ b/docparse/parse.sh
@@ -32,7 +32,9 @@ for test in `find testcases/ -name '*.c'`; do
 			echo ','
 		fi
 		first=
-		echo -n "$a"
+		cat <<EOF
+$a
+EOF
 	fi
 done
 
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
