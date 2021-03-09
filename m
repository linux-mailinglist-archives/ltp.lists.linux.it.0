Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F62332B29
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 16:56:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1860F3C6A8F
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 16:56:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 09D113C4BF0
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 16:56:24 +0100 (CET)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6FBFF1400BC4
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 16:56:24 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id u187so2486446wmg.4
 for <ltp@lists.linux.it>; Tue, 09 Mar 2021 07:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DYYYPD/xizAj6Wof/xyHU+ddvgyzSEf+jwRS6CQ00Zs=;
 b=c6cQbwPzkiLiYBpRDkPAiS9pRrOaZOu7m6TF+ySZKbHKC1wWO+Lcx/YSzKDuFl4FTV
 OOEJ/B3k3dJ3Sb1+B+qhHinnf50tdI8snPfMT0xCSlP+2Q668gdlokVqohM2nrO85Xep
 z5qBPWS4QBip5/cFsOQS3PRjscmZmvidiK01U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DYYYPD/xizAj6Wof/xyHU+ddvgyzSEf+jwRS6CQ00Zs=;
 b=Bz7XMgtt7Sl1u6hVRQI3YanJgzgLx3cbFvmdHbgWKfCbkZfmJEquZsz+zx5TxJsIv2
 uLi22UsoCzXMhKkR8rmzwCMFRcNporVAyaboDQSqb9glWUxzdt8EjMIfA0uHIy/JVC9N
 oWGmPs+DRkveb86StaiSZVBjefLPpxcvmW2fkVgDV7TEiMAmjF8rsLKXmRjQwmEIvA/O
 i68mEskOlFpQZidhdhgFJ+0GJa2gOodf8OkUWvmqK/LVp6stIIjsrkoeAgz78m1BBXXG
 vleHbPMbgZX8E6XrWmpXjoNGrvbJ0Jyckmh3XqRaxWpk8B7srN+Rvh2Aq9gMcvdfElMv
 St+g==
X-Gm-Message-State: AOAM532cu79sd1C0vmHlv8Ad8mBrX26ntJjdr9cUeBaw6/xifvboQrg0
 XUNINCOuUsr/V6GDSLhkw/ETNf0U1VckQA==
X-Google-Smtp-Source: ABdhPJzSKPUEoqvsplyJzI7SuhLlCTr0lvq2EE7lBIVIBOOz+FGqVAQ3O0UuyapAaG+gGry70+L8NQ==
X-Received: by 2002:a1c:c282:: with SMTP id s124mr4709012wmf.99.1615305383811; 
 Tue, 09 Mar 2021 07:56:23 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e1d9:50e9:2ad6:a226])
 by smtp.gmail.com with ESMTPSA id u23sm4721418wmn.26.2021.03.09.07.56.23
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 07:56:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: LTP List <ltp@lists.linux.it>
Date: Tue,  9 Mar 2021 15:56:21 +0000
Message-Id: <20210309155623.2457857-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] open_posix_testsuite/generate-makefiles.sh: Avoid
 inconsistencies with make version
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

With make 4.1, INSTALL_TARGETS+=<tab> will add a space to the variable whereas
with make 4.3, it will not. This leads to differing run.sh files in installed
in packages which is undesireable. If tests is empty we don't have to add
the line to the makefiles at all which seems like the easiest way to
avoid the differences in make behaviour.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../open_posix_testsuite/scripts/generate-makefiles.sh      | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/testcases/open_posix_testsuite/scripts/generate-makefiles.sh b/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
index 200a631db..4b3aaa4a0 100755
--- a/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
+++ b/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
@@ -148,8 +148,12 @@ EOF
 
 	fi
 
-	cat >> "$makefile.2" <<EOF
+	if [ ! -z "${tests}" ]; then
+		cat >> "$makefile.2" <<EOF
 INSTALL_TARGETS+=	${tests}
+EOF
+	fi
+	cat >> "$makefile.2" <<EOF
 MAKE_TARGETS+=		${targets}
 
 EOF
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
