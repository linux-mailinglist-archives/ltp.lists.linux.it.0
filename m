Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C28AC405D
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Oct 2019 20:48:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C1AE33C22A7
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Oct 2019 20:48:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C28613C2271
 for <ltp@lists.linux.it>; Tue,  1 Oct 2019 20:47:58 +0200 (CEST)
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 516001401147
 for <ltp@lists.linux.it>; Tue,  1 Oct 2019 20:47:58 +0200 (CEST)
Received: by mail-ed1-x543.google.com with SMTP id r9so12945807edl.10
 for <ltp@lists.linux.it>; Tue, 01 Oct 2019 11:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gMAR6T9HnVUiieLbaUq2MhvATckkcxxSW8TioVF6fNU=;
 b=t6DvuYTpfA0lo1y7webbHmF6vGpQuVGUSh6SFk+nsflpQaj25hZBWrEnNVemhL7QPQ
 m/kzmEUtJQAKvotd2EmFAHFkewgy8hNkXe4ZylJKN2Teif6fPXGKVTyJODEOIKOpWGxm
 nwEPgFM+j8n+Gy46UmZ9s/Xe43C4THV0g5wEcpO35CcA3Ri7ti8UzAIFvhofzGCRWYAh
 HFUPgQtjueQvOti/b/NdTFyRBMzbDTTqUEFF5sGuN0uypp+h3vVYhEGpp8XmVi6J20ck
 BbkFVogSnXTuK2sCN2MrVWxzekyt8As2z76IFWJkRAXTtnTVdZIXInbejWuX4AfjDfU6
 sAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gMAR6T9HnVUiieLbaUq2MhvATckkcxxSW8TioVF6fNU=;
 b=m11qOs+ZlINFnxUDOZzUgu2YJqNZhEL43R1FODlxUxeOl4EuHX5HWAHpuoggL5Uxm4
 iPlIiVWrUS7d6wyiYjZ899EmXQ7Vt7a6jHwrmv5WRdz4KmXyPm66xh4XCAoT8A3aHNro
 Vd2puQs3sD0iuT/u9dtZjFQ2e1eACg5Gs1c085qB8AiKy2htBw+a+NhEIpWRHN8ti0ju
 IjqelTJc1o4TZMTEpiT+tDNJlcZwLxEIwG4iZKweN3HGcrhfOdCyDE77Lg7qznh8TeBK
 SvEsRgZNHs16Q/j/VvZDTmXMHnWXngq2rvVLsDueEPykX8e/gW5F+uiACq/ZMImclMfr
 1ijw==
X-Gm-Message-State: APjAAAVdlumoRat02Z9UIF0uHdbp08tIN/h/7P/hFzlaHGGbZQ7MDT17
 IbkSjhpFQlZ234RdsFmY45aR0Zqr
X-Google-Smtp-Source: APXvYqyHO06n+lkGlCd1QeXmvgRaxPPX65Vd+2131muc+oVR4AzWXeRRfsA0GwWngJ/cH2YjK2B37w==
X-Received: by 2002:aa7:c343:: with SMTP id j3mr27492797edr.187.1569955677575; 
 Tue, 01 Oct 2019 11:47:57 -0700 (PDT)
Received: from dell5510.arch.suse.de ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id f29sm3321984eda.76.2019.10.01.11.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 11:47:56 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Tue,  1 Oct 2019 20:47:50 +0200
Message-Id: <20191001184750.20995-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] pkeys: Fix uclibc build caused by conflicting
 signature
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

UmVtb3Zpbmcgc3RhdGljIGZpeGVzIHRoZSBwcm9ibGVtLgoKdUNsaWJjIGRlZmluZXMgcGtleV97
YWxsb2MsZnJlZSxtcHJvdGVjdH0gc2lnbmF0dXJlcyBpbgo8Yml0cy9tbWFuLXNoYXJlZC5oPiwg
d2hpY2ggaXMgaW5jbHVkZWQgYnkgPGJpdHMvbW1hbi1saW51eC5oPi4gIEJlY2F1c2UKaXQgZG9l
cyBub3QgaW1wbGVtZW50IHRoZW0sIG91ciBpbXBsZW1lbnRhdGlvbiBzaWduYXR1cmUgY29uZmxp
Y3RzLCBhcwppdCB1c2VzIHN0YXRpYy4KCkZpeGVkIGJ1aWxkIGVycm9yOgpJbiBmaWxlIGluY2x1
ZGVkIGZyb20gcGtleTAxLmM6MzI6MDoKcGtleS5oOjE4OjE5OiBlcnJvcjogc3RhdGljIGRlY2xh
cmF0aW9uIG9mIOKAmHBrZXlfbXByb3RlY3TigJkgZm9sbG93cyBub24tc3RhdGljIGRlY2xhcmF0
aW9uCiBzdGF0aWMgaW5saW5lIGludCBwa2V5X21wcm90ZWN0KHZvaWQgKmFkZHIsIHNpemVfdCBs
ZW4sIGludCBwcm90LCBpbnQgcGtleSkKICAgICAgICAgICAgICAgICAgIF4KSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIC9vcHQvYnItdGVzdC1wa2cvYnItYXJtLWZ1bGwvaG9zdC9hcm0tYnVpbGRyb290
LWxpbnV4LXVjbGliY2dudWVhYmkvc3lzcm9vdC91c3IvaW5jbHVkZS9iaXRzL21tYW4tbGludXgu
aDoxMTU6MCwKICAgICAgICAgICAgICAgICBmcm9tIC9vcHQvYnItdGVzdC1wa2cvYnItYXJtLWZ1
bGwvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LXVjbGliY2dudWVhYmkvc3lzcm9vdC91c3IvaW5j
bHVkZS9iaXRzL21tYW4uaDo0MCwKICAgICAgICAgICAgICAgICBmcm9tIC9vcHQvYnItdGVzdC1w
a2cvYnItYXJtLWZ1bGwvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LXVjbGliY2dudWVhYmkvc3lz
cm9vdC91c3IvaW5jbHVkZS9zeXMvbW1hbi5oOjQxLAogICAgICAgICAgICAgICAgIGZyb20gcGtl
eTAxLmM6Mjk6Ci9vcHQvYnItdGVzdC1wa2cvYnItYXJtLWZ1bGwvaG9zdC9hcm0tYnVpbGRyb290
LWxpbnV4LXVjbGliY2dudWVhYmkvc3lzcm9vdC91c3IvaW5jbHVkZS9iaXRzL21tYW4tc2hhcmVk
Lmg6NzM6NTogbm90ZTogcHJldmlvdXMgZGVjbGFyYXRpb24gb2Yg4oCYcGtleV9tcHJvdGVjdOKA
mSB3YXMgaGVyZQogaW50IHBrZXlfbXByb3RlY3QgKHZvaWQgKl9fYWRkciwgc2l6ZV90IF9fbGVu
LCBpbnQgX19wcm90LCBpbnQgX19wa2V5KSBfX1RIUk9XOwogICAgIF4KSW4gZmlsZSBpbmNsdWRl
ZCBmcm9tIHBrZXkwMS5jOjMyOjA6CgpGb3VuZCB3aXRoIHRlc3QtcGtnIHRvb2wgZnJvbSBCdWls
ZHJvb3QgZGlzdHJpYnV0aW9uLgoKRml4ZXM6IDkwYzJkYzg5ZiAoInBrZXk6IGFkZCB0ZXN0IGZv
ciBtZW1vcnkgcHJvdGVjdGlvbiBrZXlzIikKClNpZ25lZC1vZmYtYnk6IFBldHIgVm9yZWwgPHBl
dHIudm9yZWxAZ21haWwuY29tPgotLS0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcGtleXMv
cGtleS5oIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wa2V5cy9w
a2V5LmggYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BrZXlzL3BrZXkuaAppbmRleCBkNjIz
MjQ0ZWIuLjE5Yzg0NDdlYiAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9w
a2V5cy9wa2V5LmgKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wa2V5cy9wa2V5LmgK
QEAgLTE1LDE3ICsxNSwxNyBAQAogI2VuZGlmCiAKICNpZm5kZWYgSEFWRV9QS0VZX01QUk9URUNU
Ci1zdGF0aWMgaW5saW5lIGludCBwa2V5X21wcm90ZWN0KHZvaWQgKmFkZHIsIHNpemVfdCBsZW4s
IGludCBwcm90LCBpbnQgcGtleSkKK2lubGluZSBpbnQgcGtleV9tcHJvdGVjdCh2b2lkICphZGRy
LCBzaXplX3QgbGVuLCBpbnQgcHJvdCwgaW50IHBrZXkpCiB7CiAJcmV0dXJuIHRzdF9zeXNjYWxs
KF9fTlJfcGtleV9tcHJvdGVjdCwgYWRkciwgbGVuLCBwcm90LCBwa2V5KTsKIH0KIAotc3RhdGlj
IGlubGluZSBpbnQgcGtleV9hbGxvYyh1bnNpZ25lZCBpbnQgZmxhZ3MsIHVuc2lnbmVkIGludCBh
Y2Nlc3NfcmlnaHRzKQoraW5saW5lIGludCBwa2V5X2FsbG9jKHVuc2lnbmVkIGludCBmbGFncywg
dW5zaWduZWQgaW50IGFjY2Vzc19yaWdodHMpCiB7CiAJcmV0dXJuIHRzdF9zeXNjYWxsKF9fTlJf
cGtleV9hbGxvYywgZmxhZ3MsIGFjY2Vzc19yaWdodHMpOwogfQogCi1zdGF0aWMgaW5saW5lIGlu
dCBwa2V5X2ZyZWUoaW50IHBrZXkpCitpbmxpbmUgaW50IHBrZXlfZnJlZShpbnQgcGtleSkKIHsK
IAlyZXR1cm4gdHN0X3N5c2NhbGwoX19OUl9wa2V5X2ZyZWUsIHBrZXkpOwogfQotLSAKMi4yMy4w
CgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZv
L2x0cAo=
