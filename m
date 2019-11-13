Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70554F9FA2
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 01:56:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1930F3C247D
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 01:56:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 443043C2451
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 01:56:38 +0100 (CET)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6BDA560107E
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 01:56:38 +0100 (CET)
Received: by mail-wr1-x444.google.com with SMTP id l7so334452wrp.6
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 16:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dc/xQOuLU+XjhfcGqQssYC0pfzQMyExxMgegNwxz1/Y=;
 b=dGUxN6IwzB0/771EAn4yOrTyIj5HoCRcL4+ek3dpqpWQYTZKXtMdYtZ4XlwCdg7hbe
 0HV/y2V2WB/IpzH67YGfsF3vxwW2d1yLQwEQ7o59htALXZvFeG/5EjMUH3Kltf0ghgzT
 8Hkg3Zh/yiP14SXPX5em+Di25NbYAkmg+Iasl/FryDsw3cG9s4mDtJeVv6igCRGSupCH
 6oL6cCj0bydJ8zAUkZ05OtsYQJ3nuZFCch4nhtzlXm5wCq94nhrsXFmuWanuoV56JCWB
 GaVfSQ/8tzz1tvQI8hsf8ND4DmOUbhF25J/YRrXJvVd+Y9DubUtcRQKUbRlwa2lmHV49
 xZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dc/xQOuLU+XjhfcGqQssYC0pfzQMyExxMgegNwxz1/Y=;
 b=LuneEKQSc2CnSt6I9Enq5u345HaYhUqfYaznP2VUiAxrk5l5IidAMHqbp7ZU3Jez5k
 ONVk76k8yxKma3mY7rP9hSuAdiCPMMpfoRA1dSC7BCXxKz1b+nzX3boQIdUfCRZomvQp
 J6RFiNmF/l7KVjebX347BMMD8RPqv9+h23MMrQrolm5jZtwouSkYDHNil4sNgbk0xLgQ
 zs3TmVBThBoQvTPwN4AXB14xafcXxBSHUPshVPomUkiO0SKzEj+CfnL44Ka15NWqqwfT
 kkjjCvbYT5BvmhzdCgBARGONTLjZ5BVIh4IXbL0sc+cDixzHBpqkiFOaMN+xr0usk0fw
 AHTw==
X-Gm-Message-State: APjAAAXVZ2PpSTTnKRaeV5C9IkCVXiAoyjtclhQu85xlxugSRCpi61Cs
 GG0Gmsxr9WupW/RyZhxmauor+2vJ
X-Google-Smtp-Source: APXvYqz5PyHVAwu35aaMVVyZqOKedteh8Q/vCVParo9qcGfOfR+WL23zw+BOKVARWKjzxRdUHVS1NQ==
X-Received: by 2002:a5d:6746:: with SMTP id l6mr121287wrw.349.1573606597610;
 Tue, 12 Nov 2019 16:56:37 -0800 (PST)
Received: from x230.suse.cz ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id z4sm431546wmf.36.2019.11.12.16.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 16:56:36 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 13 Nov 2019 01:56:24 +0100
Message-Id: <20191113005626.19585-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113005626.19585-1-petr.vorel@gmail.com>
References: <20191113005626.19585-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] fanotify: Move __kernel_fsid_t definition to
 correct place
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
Cc: Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

VGhpcyBmaXhlcyBlcnJvcnM6CgpmYW5vdGlmeS5oOjE0OTo1NTogZXJyb3I6IHVua25vd24gdHlw
ZSBuYW1lIOKAmF9fa2VybmVsX2ZzaWRfdOKAmQogc3RhdGljIGlubGluZSB2b2lkIGZhbm90aWZ5
X2dldF9maWQoY29uc3QgY2hhciAqcGF0aCwgX19rZXJuZWxfZnNpZF90ICpmc2lkLAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+CmZhbm90aWZ5MTMuYzo0NzoyOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg4oCYX19r
ZXJuZWxfZnNpZF904oCZCiAgX19rZXJuZWxfZnNpZF90IGZzaWQ7CgpSZW1vdmUgI2lmZGVmIEhB
VkVfTkFNRV9UT19IQU5ETEVfQVQgd3JhcCBvZiBfX2tlcm5lbF9mc2lkX3QgZmFsbGJhY2sKZGVm
aW5pdGlvbiB0byBzaW1wbGlmeSBwcmVwcm9jZXNzb3IgY2hlY2tzLgoKRml4ZXM6IGI4YWViYzgz
NSAoImZhbm90aWZ5OiBGaXggbWlzc2luZyBfX2tlcm5lbF9mc2lkX3QgZGVmaW5pdGlvbiIpCgpT
aWduZWQtb2ZmLWJ5OiBQZXRyIFZvcmVsIDxwZXRyLnZvcmVsQGdtYWlsLmNvbT4KLS0tCiB0ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5LmggfCAxOCArKysrKysrKyst
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlm
eS5oIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeS5oCmluZGV4
IDQzNWYxMDBkOC4uNTczZWQ1ZjU5IDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL2Zhbm90aWZ5L2Zhbm90aWZ5LmgKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9m
YW5vdGlmeS9mYW5vdGlmeS5oCkBAIC0xMTYsNiArMTE2LDEzIEBAIHN0cnVjdCBmYW5vdGlmeV9t
YXJrX3R5cGUgewogCWNvbnN0IGNoYXIgKiBuYW1lOwogfTsKIAorI2lmbmRlZiBfX2tlcm5lbF9m
c2lkX3QKK3R5cGVkZWYgc3RydWN0IHsKKwlpbnQJdmFsWzJdOworfSBsYXBpX2ZzaWRfdDsKKyNk
ZWZpbmUgX19rZXJuZWxfZnNpZF90IGxhcGlfZnNpZF90CisjZW5kaWYgLyogX19rZXJuZWxfZnNp
ZF90ICovCisKICNpZm5kZWYgRkFOX1JFUE9SVF9GSUQKICNkZWZpbmUgRkFOX1JFUE9SVF9GSUQJ
CTB4MDAwMDAyMDAKIApAQCAtMTI2LDIwICsxMzMsMTMgQEAgc3RydWN0IGZhbm90aWZ5X2V2ZW50
X2luZm9faGVhZGVyIHsKIH07CiAKICNpZmRlZiBIQVZFX05BTUVfVE9fSEFORExFX0FUCi0jaWZu
ZGVmIF9fa2VybmVsX2ZzaWRfdAotdHlwZWRlZiBzdHJ1Y3QgewotCWludAl2YWxbMl07Ci19IGxh
cGlfZnNpZF90OwotI2RlZmluZSBfX2tlcm5lbF9mc2lkX3QgbGFwaV9mc2lkX3QKLSNlbmRpZgot
CiBzdHJ1Y3QgZmFub3RpZnlfZXZlbnRfaW5mb19maWQgewogCXN0cnVjdCBmYW5vdGlmeV9ldmVu
dF9pbmZvX2hlYWRlciBoZHI7CiAJX19rZXJuZWxfZnNpZF90IGZzaWQ7CiAJdW5zaWduZWQgY2hh
ciBoYW5kbGVbMF07CiB9OwotI2VuZGlmCi0jZW5kaWYKKyNlbmRpZiAvKiBIQVZFX05BTUVfVE9f
SEFORExFX0FUICovCisjZW5kaWYgLyogISBGQU5fUkVQT1JUX0ZJRCAqLwogCiAjaWZkZWYgSEFW
RV9OQU1FX1RPX0hBTkRMRV9BVAogLyoKLS0gCjIuMjQuMAoKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
