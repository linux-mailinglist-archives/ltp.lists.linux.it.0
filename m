Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC962B060D
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 14:11:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 574403C525F
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 14:11:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3CC303C2650
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 14:11:43 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6A593200E07
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 14:11:41 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA883AB95;
 Thu, 12 Nov 2020 13:11:40 +0000 (UTC)
Date: Thu, 12 Nov 2020 14:11:39 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20201112131139.GA4962@pevik>
References: <20201103191327.11081-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103191327.11081-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 00/11] 	Test metadata extraction
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> address some of the notes added by Li.

> changes v1->v2:

> 3rd commit
> https://patchwork.ozlabs.org/project/ltp/patch/20201005133054.23587-4-chrubis@suse.cz/
> * add buf[i++] = c; to fix parsing ""
> * check fname is valid before opening it
> * fix some of checkpatch.pl problems

> 9th commit
> * add perl-libwww-perl for fedora/centos

> 11 th commit
> * add *.css *.js to CLEAN_TARGETS

> TODO
> * I didn't filter "options". But agree they should be handled better than now.
> * some checkpatch.pl warnings left, do we want to bother?
> docparse/docparse.c:53: WARNING: Missing a blank line after declarations
> docparse/docparse.c:206: ERROR: do not use assignment in if condition
> docparse/docparse.c:211: WARNING: Missing a blank line after declarations
> docparse/docparse.c:246: ERROR: do not use assignment in if condition
> docparse/docparse.c:288: WARNING: Missing a blank line after declarations
> docparse/docparse.c:297: WARNING: static const char * array should probably be static const char * const
> docparse/docparse.c:352: WARNING: static const char * array should probably be static const char * const
> total: 2 errors, 5 warnings, 423 lines checked

> * I didn't change docparse/README.md (4th commit, Jan had some notes,
> could you phrase what should be there?)

> Anything else to change?

Anybody against pushing whole patchset [1] with fix below for third commit
("docparse: Add test documentation parser").


Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/list/?series=211956&state=*

Fix for third commit:

diff --git docparse/docparse.c docparse/docparse.c
index 63d131c87..be6125353 100644
--- docparse/docparse.c
+++ docparse/docparse.c
@@ -138,10 +138,8 @@ const char *next_token(FILE *f, struct data_node *doc)
 
 		if (in_str) {
 			if (c == '"') {
-				if (i == 0 || buf[i-1] != '\\') {
-					buf[i++] = c;
+				if (i == 0 || buf[i-1] != '\\')
 					goto exit;
-				}
 			}
 
 			buf[i++] = c;
@@ -189,7 +187,7 @@ const char *next_token(FILE *f, struct data_node *doc)
 	}
 
 exit:
-	if (i == 0)
+	if (i == 0 && !in_str)
 		return NULL;
 
 	buf[i] = 0;

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
