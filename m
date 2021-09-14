Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE8C40AD7B
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 14:24:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F16603C8A08
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 14:24:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DF8F13C1DB4
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 14:24:47 +0200 (CEST)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id F29E460162F
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 14:24:46 +0200 (CEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so1984503pjc.3
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 05:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mPQSxuqw1e0LZL3sG+vkk08aLtCQcjJZeNX6AKx+h+M=;
 b=iYYcZ3xv1H7Tek7kgU6P9ELzQR84kT6q3ZEgEOXJokWN0QubAZddh1O/hiJAjI3Lnc
 HJn3Hy2XJCuZdG7sxgF4B0OujRVcz1dgNyqsdc6AhUPbKb1gfKTWPagtXM/+gMIQCR2O
 FrmdnShJ/7QhnS1OwBBTyslH2yIwmssui5SJ3AMt2K27ZqnxENDGNqgig18P7fsyx3Rc
 35Fa8HDbePEmak+ukcebeHnrfdUq3r8kZ6AZwwHIiJrDhfc75nqbYvvBAC4sS6cA2M8z
 PvAg3Jz/PvqtpG41pUPyhrcn95ToJCAC3sdjRzIn7iPI/ggoTTXJNDnJ4URT9eFca08h
 bWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mPQSxuqw1e0LZL3sG+vkk08aLtCQcjJZeNX6AKx+h+M=;
 b=OFSDcdKZmS6/9BTwew4C64rTSQQ+F+g1v7QRZJav38eqmG09YzTh3C9KUiXmQTXK82
 XSJP20BRyHY9aoF9ys0/qIZFl5RT+88T4GQrb9u6nI9VQwvj+nYyfuKU0cnXKEOnJ6VD
 2R20A2GIue279rpOZe5fT865AxuH7KFf9YUD9bXpOt6oS+TP0IzzTQg7+prsusgXko9u
 GbN5H5lbw61MiyA/XfvoqAgITnYPO37lUIaLFUqPS6Z8nOd8UyhpZ7ewIoixqzUzfS2O
 ZqZXNDOeKTSHlgelP8lv/Zf9LRZDX037KCp4MxhbPh7IFtgsGVtaoSqcZFnQ/Al8oF/f
 kC2w==
X-Gm-Message-State: AOAM533I15LjZb7JLLphGrmUFeJc4yFLOU1HGuZy8nulPEQneD6JAfpx
 B9K3N4An1CQWM9DLT/C3IKlokKsUubrYkQ==
X-Google-Smtp-Source: ABdhPJz8cbdKCE4cD9FCJEGiLzzmRdKTjirnuFsHNc1MD2YpLL2ibWqmCoykv64aiRwzQPK7x6m9MQ==
X-Received: by 2002:a17:902:9a8e:b0:12d:cb3c:c4d7 with SMTP id
 w14-20020a1709029a8e00b0012dcb3cc4d7mr14899588plp.18.1631622284400; 
 Tue, 14 Sep 2021 05:24:44 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4070:4e95:9173:770c:2c67:ffa6:19ab])
 by smtp.gmail.com with ESMTPSA id d63sm1663606pjk.17.2021.09.14.05.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 05:24:43 -0700 (PDT)
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 14 Sep 2021 17:54:24 +0530
Message-Id: <20210914122425.85129-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] runtest/smoketest: Remove intermittent failed
 test case route4-change-dst
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

The test case route4-change-dst fails intermittently creating
the problem for smoketest results verdict. route4-change-dst
is a stress test should not be a part of smoketest. because of
these issues removing route4-change-dst from the smoketest.

Suggested-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
---
 runtest/smoketest | 1 -
 1 file changed, 1 deletion(-)

diff --git a/runtest/smoketest b/runtest/smoketest
index 7f395936e..dd689bd6f 100644
--- a/runtest/smoketest
+++ b/runtest/smoketest
@@ -12,5 +12,4 @@ stat04 symlink01 -T stat04
 utime01A symlink01 -T utime01
 rename01A symlink01 -T rename01
 splice02 splice02 -s 20
-route4-change-dst route-change-dst.sh
 shell_test01 echo "SUCCESS" | shell_pipe01.sh
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
