Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFF13B9192
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 14:24:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C34E53C9371
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 14:23:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3C11D3C6B12
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 14:23:57 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A89B4600F7C
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 14:23:56 +0200 (CEST)
Received: from mail-ej1-f71.google.com ([209.85.218.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lyvjX-0001q6-LJ
 for ltp@lists.linux.it; Thu, 01 Jul 2021 12:23:55 +0000
Received: by mail-ej1-f71.google.com with SMTP id
 k1-20020a17090666c1b029041c273a883dso2039411ejp.3
 for <ltp@lists.linux.it>; Thu, 01 Jul 2021 05:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3iEeadytsONpFC4Vt/0ibWMPkDoNa1r5+cmyCa9WRkY=;
 b=L1ris0843MFvA5/tHXcetorrwvUGZpZDeJg8wxDrS9Irpn/odSkjY2SnL7mgyc8PYL
 Rf7+ULxfkwEwKn7dCg/gYYWZ8uMBSPbnIcgfphn7BEESLnwXBh9c8DpdtEetWJveOQUI
 +ls+DC06BBArvuva5rIvZqaTR6Ak3Si5aXjiEFGYV5J2mpPesK1tc6uyLRvbpS6uCrB2
 7cNSSdQrvzFuTH0C8yK1MkK6J3Y7N0a/yPR1t/pO81Uq9iJ9rER0vq5sRLUMBNP5izRi
 RwAM2XY4T8d6tZD2OcDDTKcZFOzP59+td7Sdm0W+5Ab8Kd8CVFrTru2NLkp3xAhyebPy
 zzMg==
X-Gm-Message-State: AOAM531xzd5xK/Ku8ggL0hhGouymYzuSJn6sk0/c7qNa4OAGONNZ+ht/
 LqMavF7gK3bvQCqaSWgwIUQ/o1DAAwVIgXLkiv3G+BUqioBITjhcpv5GIlyk8Xae9QLSjajSd0i
 fOx1i7hqZ7oRXHl7rv+trn6gdWXgE
X-Received: by 2002:a50:8e16:: with SMTP id 22mr18861363edw.369.1625142234748; 
 Thu, 01 Jul 2021 05:23:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCByHPd6rTwAv0vnG6SfB8BHml1Pcm+gC+T7PQdJ8TxIZ0xc+l6yaZGr7q8F0JxF1GRl+OWg==
X-Received: by 2002:a50:8e16:: with SMTP id 22mr18861351edw.369.1625142234646; 
 Thu, 01 Jul 2021 05:23:54 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id l26sm14423440edt.40.2021.07.01.05.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 05:23:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Thu,  1 Jul 2021 14:23:51 +0200
Message-Id: <20210701122351.56397-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210701122351.56397-1-krzysztof.kozlowski@canonical.com>
References: <20210701122351.56397-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] proc01: remove unused lsm_should_work
 (-Wunused-const-variable)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

UmVjZW50IHJlZmFjdG9yaW5nIG1hZGUgdGhlICJsc21fc2hvdWxkX3dvcmsiIHVudXNlZCB3aXRo
b3V0CmxpYnNlbGludXgtZGV2OgoKICAgIHByb2MwMS5jOjE0MjoxOTogd2FybmluZzog4oCYbHNt
X3Nob3VsZF93b3Jr4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJp
YWJsZT1dCgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296
bG93c2tpQGNhbm9uaWNhbC5jb20+Ci0tLQogdGVzdGNhc2VzL2tlcm5lbC9mcy9wcm9jL3Byb2Mw
MS5jIHwgNyArLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9mcy9wcm9jL3Byb2MwMS5jIGIv
dGVzdGNhc2VzL2tlcm5lbC9mcy9wcm9jL3Byb2MwMS5jCmluZGV4IDI4MmM3MGU5NDg4Mi4uYzkw
ZTUwOWEzMjQzIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL2ZzL3Byb2MvcHJvYzAxLmMK
KysrIGIvdGVzdGNhc2VzL2tlcm5lbC9mcy9wcm9jL3Byb2MwMS5jCkBAIC0xMzcsMTIgKzEzNyw3
IEBAIHN0YXRpYyBjb25zdCBjaGFyIGxzbV9zaG91bGRfd29ya1tdW1BBVEhfTUFYXSA9IHsKIAki
L3Byb2Mvc2VsZi9hdHRyLyoiLAogCSIvcHJvYy9zZWxmL2F0dHIvc2VsaW51eC8qIiwKIAkiL3By
b2Mvc2VsZi90YXNrL1swLTldKi9hdHRyLyoiLAotCSIiCi19OwotCi0vKiBQbGFjZSBob2xkZXIg
Zm9yIG5vbmUgb2YgTFNNIGlzIGRldGVjdGVkLiAqLwotI2Vsc2UKLXN0YXRpYyBjb25zdCBjaGFy
IGxzbV9zaG91bGRfd29ya1tdW1BBVEhfTUFYXSA9IHsKKwkiL3Byb2Mvc2VsZi90YXNrL1swLTld
Ki9hdHRyL3NlbGludXgvKiIsCiAJIiIKIH07CiAjZW5kaWYKLS0gCjIuMjcuMAoKCi0tIApNYWls
aW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
