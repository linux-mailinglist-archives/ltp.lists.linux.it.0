Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B98803563B
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 07:33:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 866DE3EA6CB
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 07:33:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8C35A3EA602
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 07:33:38 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B73E820015D
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 07:33:37 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id q10so3949837pff.9
 for <ltp@lists.linux.it>; Tue, 04 Jun 2019 22:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/BHgT8WDeay8buYH/M4UbFYT8IhGHo9J49naarFWAe0=;
 b=csJWa3Sb1hKxud1F4Iz1k3ABlA26l2I35vjcmsr1LKpoWluaqjNJHR8V8Uyi24yvHf
 gBMFpvcm4ga3SQtgPnJmR7ZHc59pVKoZW6dn7he8bRE5SqMfFPVU4f3a1+4DOzkfcepR
 rDtZhkZ0aPveSXzYd184rCEI29vfk9JTnI0hSTw5NPjDN1bfuZkBeQ6DC3YGIQvskimR
 ohqru0o69eKQFfS2fthFAi52JoMe0UUgb7xoYJ0H508Fc47mwPsuc0Vg38eBANfOts/5
 /TtR3/dbGD7r6xzsPh5nlgKVsMflHJR2fbzEgkfPcW6MgSK3JcXFCmdIRV17/Pj2I6h2
 3A8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/BHgT8WDeay8buYH/M4UbFYT8IhGHo9J49naarFWAe0=;
 b=pMXP5n4qWPALrz7V/NcG9c9MfqQO4hNijCXSKUu74HFQ0QbuOiXx5GE/i8trt4CQwP
 DQEYnKG4PM5Lt1+vGhlIvdVk2M9uPnOEcGmTky7Ra1bi197gC+SCsdVfCmjjgZZCBYA5
 kmlw9JSIEMRtVbON4/C0mgqY85ysnVfWLJCw5miyMyyqAUYN/R5YQdQHuWg0qjuV+C/B
 lWtQs5vuuFHqja0HKrWmkwB1hi3yfvK7H3ElHCUf7xr2VHF9Uw4yXoTAatB8nLEiRQKJ
 KQYS2uWaB9Rsiraox2xqJWVIv/LGgnCVx2b6/tazOCZOzGeu28+l/fleTV/GfHYLgt6w
 P6ZA==
X-Gm-Message-State: APjAAAWZgQiuHkZxCWMd5eRNdRZy9nYg8owAXs6ViM5HqpFaL7KIERx8
 JQ+x5dbXgGNQH3sPKAAUEuJaaQFDVMI=
X-Google-Smtp-Source: APXvYqwJlV2QDtfJFY9IPqpwj8+5csXlKRFWou6bGvGDW6M+1AT6+K+iHnp/9iKmwwycNCsiPBQw3g==
X-Received: by 2002:a63:de43:: with SMTP id y3mr2045847pgi.271.1559712816218; 
 Tue, 04 Jun 2019 22:33:36 -0700 (PDT)
Received: from XZHOUW.usersys.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id d7sm9347318pfq.0.2019.06.04.22.33.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 22:33:35 -0700 (PDT)
From: Murphy Zhou <jencce.kernel@gmail.com>
To: ltp@lists.linux.it,
	chrubis@suse.cz,
	yangx.jy@cn.fujitsu.com
Date: Wed,  5 Jun 2019 13:33:12 +0800
Message-Id: <20190605053312.17369-1-jencce.kernel@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <5CF750DF.9040006@cn.fujitsu.com>
References: <5CF750DF.9040006@cn.fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3] syscalls/preadv2/preadv203: set mount_device flag
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
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

Tm93IHRoZSB0ZXN0cyBhcmUgcnVubmluZyBpbiBNT1VOVFBPSU5UIHdpdGhvdXQgaXQgbW91bnRl
ZC4gRmFpbHMgb24KTkZTLCBjaWZzLCB0bXBmczoKCiAgICBwcmVhZHYyMDMuYyBkb2VzIG5vdCBz
ZXQgbW91bnRfZGV2aWNlLCB3aGljaCBtYWtlcyBCUk9LOgogICAgICBwcmVhZHYyMDMuYzoxMjI6
IEJST0s6IHByZWFkdjIoKSBmYWlsZWQ6IEVPUE5PVFNVUFAKClNpZ25lZC1vZmYtYnk6IE11cnBo
eSBaaG91IDxqZW5jY2Uua2VybmVsQGdtYWlsLmNvbT4KLS0tCnYzOgogIGltcHJvdmUgY29tbWl0
IG1lc3NhZ2UKdjI6CiAgc2V0IG1vdW50X2RldmljZSBpbiBwcmVhZHYyMDMuYywgcmF0aGVyIHRo
YW4gaW4gdGhlIGxpYnJhcnkKCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3ByZWFkdjIvcHJl
YWR2MjAzLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdp
dCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcHJlYWR2Mi9wcmVhZHYyMDMuYyBiL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvcHJlYWR2Mi9wcmVhZHYyMDMuYwppbmRleCA4MTBkMWU4ZGIu
LmU0ZjY4YTUxYiAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmVhZHYy
L3ByZWFkdjIwMy5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcHJlYWR2Mi9wcmVh
ZHYyMDMuYwpAQCAtMjYxLDYgKzI2MSw3IEBAIHN0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9
IHsKIAkuY2xlYW51cCA9IGNsZWFudXAsCiAJLnRlc3RfYWxsID0gdmVyaWZ5X3ByZWFkdjIsCiAJ
Lm1udHBvaW50ID0gTU5UUE9JTlQsCisJLm1vdW50X2RldmljZSA9IDEsCiAJLmFsbF9maWxlc3lz
dGVtcyA9IDEsCiAJLm5lZWRzX3RtcGRpciA9IDEsCiAJLm5lZWRzX3Jvb3QgPSAxLAotLSAKMi4y
MS4wCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3Rp
bmZvL2x0cAo=
