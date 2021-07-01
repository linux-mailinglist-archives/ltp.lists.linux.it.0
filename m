Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 290393B9217
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 15:14:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E92453C9AB2
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 15:14:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BA1313C9386
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 15:14:33 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6C05C1A01492
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 15:14:33 +0200 (CEST)
Received: from mail-ej1-f69.google.com ([209.85.218.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lywWW-0004zz-Mf
 for ltp@lists.linux.it; Thu, 01 Jul 2021 13:14:32 +0000
Received: by mail-ej1-f69.google.com with SMTP id
 q14-20020a1709066aceb029049fa6bee56fso2063867ejs.21
 for <ltp@lists.linux.it>; Thu, 01 Jul 2021 06:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0oJKwHvJBDV+D3++Iq8I7sSy2fh/vVzuhYsDwh2JNME=;
 b=OGRPm54Pf7pnXOFLTRaY2ZQNAQBEAu382j9/bPClRJ1PPXMMo6kPOFbKzbYLGYl8AP
 Jvb98B0Rxt6A45U9CtcgWDrZ7mRJZtVXhXg6ooSxrNw4IwOxmkQS4z+gwdyYz94jealP
 X6sdMWdrRJu+T/YM5zRLDD47ZlgczqnMwGT2ZJM671MGKd1V3ULgiV1B60kCo86JvQX+
 i+M829kVJq9r/jgCDtvWYii+QKMTRw/YsSgjlI7+Os3mZ6ZA82t86veW+S3bh24U+nJH
 F+/DV97ooYSsgku7WipzPNhSnAKy9vWhZHyhrcDh8i/72n9RerLFBgQ/g8kjH3ftECsX
 AJSA==
X-Gm-Message-State: AOAM530oScAVkVgxtg7/sTm9hX2apQNbr/aR+FNzPwLRPLASGqiZ2y6r
 AICu/PkrhF4vJgU1qb7/wegEavHao2IexE4t8X+ySK/p03kW7GYJLxxBFRwmKfqqSYhQ7N5+6YQ
 567RVWbkS/lWuxUl+Ne4+egeP2jUG
X-Received: by 2002:a05:6402:1111:: with SMTP id
 u17mr54497635edv.87.1625145272306; 
 Thu, 01 Jul 2021 06:14:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgEmlqWREhYaNvIZLzZLimOo8npR/CcQiYNHDidbjWwDg2ZIR675B9UkGyZMgyRN/n4zdLBQ==
X-Received: by 2002:a05:6402:1111:: with SMTP id
 u17mr54497603edv.87.1625145272097; 
 Thu, 01 Jul 2021 06:14:32 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id du7sm14032595edb.1.2021.07.01.06.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 06:14:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Thu,  1 Jul 2021 15:14:27 +0200
Message-Id: <20210701131427.72574-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210701131427.72574-1-krzysztof.kozlowski@canonical.com>
References: <20210701131427.72574-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] proc01: remove unused lsm_should_work
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
bG93c2tpQGNhbm9uaWNhbC5jb20+CgotLS0KCkNoYW5nZXMgc2luY2UgdjE6CjEuIEZpeHVwIHBh
cnQgb2YgIzEgcGF0Y2guCi0tLQogdGVzdGNhc2VzL2tlcm5lbC9mcy9wcm9jL3Byb2MwMS5jIHwg
NiAtLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rl
c3RjYXNlcy9rZXJuZWwvZnMvcHJvYy9wcm9jMDEuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvZnMvcHJv
Yy9wcm9jMDEuYwppbmRleCA2ZGRiNjY4MmYzOGIuLmM5MGU1MDlhMzI0MyAxMDA2NDQKLS0tIGEv
dGVzdGNhc2VzL2tlcm5lbC9mcy9wcm9jL3Byb2MwMS5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwv
ZnMvcHJvYy9wcm9jMDEuYwpAQCAtMTQwLDEyICsxNDAsNiBAQCBzdGF0aWMgY29uc3QgY2hhciBs
c21fc2hvdWxkX3dvcmtbXVtQQVRIX01BWF0gPSB7CiAJIi9wcm9jL3NlbGYvdGFzay9bMC05XSov
YXR0ci9zZWxpbnV4LyoiLAogCSIiCiB9OwotCi0vKiBQbGFjZSBob2xkZXIgZm9yIG5vbmUgb2Yg
TFNNIGlzIGRldGVjdGVkLiAqLwotI2Vsc2UKLXN0YXRpYyBjb25zdCBjaGFyIGxzbV9zaG91bGRf
d29ya1tdW1BBVEhfTUFYXSA9IHsKLQkiIgotfTsKICNlbmRpZgogCiAvKiBLbm93biBmaWxlcyB0
aGF0IGRvZXMgbm90IGhvbm9yIE9fTk9OQkxPQ0ssIHNvIHRoZXkgd2lsbCBoYW5nCi0tIAoyLjI3
LjAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGlu
Zm8vbHRwCg==
