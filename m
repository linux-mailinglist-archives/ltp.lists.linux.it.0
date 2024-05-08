Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2618C05FE
	for <lists+linux-ltp@lfdr.de>; Wed,  8 May 2024 23:01:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1715202098; h=mime-version :
 message-id : to : date : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=zjKPuolMzNBCiRcGgDkYIyVPG2akeyW33t3morfCjJM=;
 b=iQk9ru6FXiOnaTVhUqJzxNQLDWQjNFy88EIObXdbqATDI7EAd9UvXJBoEJdii7Nji9nND
 B82+9RZ/gG6TGOmRSJNK4nJTnleXfv3TcoubJnPuAZmJwt0nQ7Phw8m4LJlcEfpW9s8xb0U
 X7BDbrgFZRBvjFLrClnEi9l3Wg4OAPs=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8281D3CE06B
	for <lists+linux-ltp@lfdr.de>; Wed,  8 May 2024 23:01:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5A24C3C0313
 for <ltp@lists.linux.it>; Wed,  8 May 2024 23:01:36 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=wine.dev@web.de;
 receiver=lists.linux.it)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 41B6F600040
 for <ltp@lists.linux.it>; Wed,  8 May 2024 23:01:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1715202092; x=1715806892; i=wine.dev@web.de;
 bh=ap9W4wwknKboGGTWSr8fvD9umhMI0YdWk7YdjfMRhqI=;
 h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Subject:
 Content-Type:Date:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Vj9uAgcgzIczSy5O7ITDEvnMG0vwl0k2jUbz4Qqz+OM5zEewX7YgyU5e8ZT9v5ML
 rg03kqCzq0bOG+1JA1WWvcKUec2OjL/v6GOesTQsYH3Nx2E+UCV58HXPFA+pX2bld
 26dFem7eJau/drltTNiuGu7sBzbhPE3XQtU4aEB0g4Bks+rYh2X7nKV9uJV9FVM67
 eAWHUpwMLb/0t0IrYC2GomBU211I+E3UMU5qWBnNEcqL2qY+NJO909e43Gy9KvR6a
 FREm2+iTX3Wge57oJjmv+wRa1dIhYM9fnZnl03mMsaJ/I31Enxn8cUVleHZ3Ak5T+
 kCd4RLralS7rNfrpaA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [79.232.219.30] ([79.232.219.30]) by web-mail.web.de
 (3c-app-webde-bap44.server.lan [172.19.172.44]) (via HTTP); Wed, 8 May 2024
 23:01:32 +0200
MIME-Version: 1.0
Message-ID: <trinity-73a44add-26d5-4c8b-b6ad-0576beafb79a-1715202092298@3c-app-webde-bap44>
To: ltp@lists.linux.it
Date: Wed, 8 May 2024 23:01:32 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:QrftUG/M1qZ6exy9jyVaYLg2pMwRP+AtVN5Rdcpif0ncKB0SPQcPK77KqkgFXVmoID3y7
 hdYCE7/RJEcEGcDj2UGGJ9wrVz4bJjJRJIZFKr9P6nJBJDFcWZnfB7QL1m3qUY14NsGqm+Zyz5wE
 48/mx8W3PoogaKiG4PNwmI5nvtMKecAjIkByyPBrLTLi+AwYRLR15VGuJ9qrCllhUaiMQtUH/K/E
 QA6fp3fWRnkzsfK/9Mjfv2Thv1OpqDXJqsU4NIdH9iRY2bOkiYcYfK3MQk56EFpIPneDvwpqUZo5
 2c=
UI-OutboundReport: notjunk:1;M01:P0:Gqyw8S5dt+Y=;VsgUSEtHEfxL6SehQLtObmSIeA7
 px5aoraVlbRkWqXpJv28I9jOP2pOXpRG5tZ2HgG6faxjd9AfNeechmR6RDPZ3QN46hDa3UDa2
 UJoGsqxYEs75OGyFplBsWAFJQwv+M5GNiUlTNo9gqNL77VRA1vgzYameIJAIDwqPsCOAaG32g
 FH8GhG/iRzdKAFpji7V3hzByBDweOcYGrhh8e12fbkeqY14SXLCn9wTz5xZpiMzMBR3nxUiRM
 oJsUJYShskstBStqewc1jpXoy3A/pCmIUYs2KFug63wIGpd8i7QVFbVFOnd2Ea4b3fzKN8GWP
 bhqdhITj432j7z+nRTRWzIZan6B/SPD5Kc+ZALlqTWIZfs6xeBuxRg4VqyN78XerAMU+7dcg2
 mXaXzEb5aSfXhklhFN1v8B7cknGekRH2HDg5wB5Ph3He09kewyfViAmtNiwWJoMZc+LdJzhKN
 Dj3iuSZ8xnGiTnJawtWiNcHR23R8v1VXIsHAiVoCjFYZL6vseDCNKdiNiYRsqu6Mole8WyQjL
 yd6vD8s4Fbd/kFPOG3RFAPlo473rcqmZ1Uc5kwPVCBLs4zcotbZhMLciBc4G6x/Dl2bATTxqt
 zS9sCwE9YVEruHz2UcnveTw1/NEsErSammX+iEnBiUQ/s98Do9I58mDOjLRKKZN8sDqe51R/Y
 mzgOslv1rpSaGweVD1/bhKgD4d+/ZiMCt0kNnyF2X7P6dvnZLwRRWRUqv9nXCS4=
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] open_posix_testsuite: Remove inclomplete warning
 commandline argument
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
From: Detlef Riekenberg via ltp <ltp@lists.linux.it>
Reply-To: Detlef Riekenberg <wine.dev@web.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The Open Posix testsuite calls the compiler with the commandline argument
"-W", but that is not a supported gcc warning option
and breaks other compiler.

This patch removes the broken "-W" commandline argument.

Fixes commit 8071ba7

References:
https://gcc.gnu.org/onlinedocs/gcc/Option-Summary.html
https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html

--
Regards ... Detlef


Signed-off-by: Detlef Riekenberg <wine.dev@web.de>


---
 testcases/open_posix_testsuite/include/mk/config.mk.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/open_posix_testsuite/include/mk/config.mk.in b/testcases/open_posix_testsuite/include/mk/config.mk.in
index c9a4b5c5a..a43de6641 100644
--- a/testcases/open_posix_testsuite/include/mk/config.mk.in
+++ b/testcases/open_posix_testsuite/include/mk/config.mk.in
@@ -14,4 +14,4 @@ testdir_rel := @testdir@
 testdir     := ${prefix}/${testdir_rel}
 testdir_bin := ${testdir}/bin

-CFLAGS  += -std=c99 -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -W -Wall
+CFLAGS  += -std=c99 -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -Wall
--
2.40.1



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
