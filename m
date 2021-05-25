Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C56390BF0
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 00:08:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 061BA3C94FA
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 00:08:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B67A33C2B2E
 for <ltp@lists.linux.it>; Wed, 26 May 2021 00:08:26 +0200 (CEST)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DB9BB60073F
 for <ltp@lists.linux.it>; Wed, 26 May 2021 00:08:25 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id z130so17564257wmg.2
 for <ltp@lists.linux.it>; Tue, 25 May 2021 15:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=Tbwzx0Dn90r7S7YX77dYKaDkXGq/4kEdZV7TAaCUvVs=;
 b=HDhkvSpPT7IoZgsRGaNIrtD7U9VmqXPapes2kU35G6JaPXdtH9TYUzlGYFxuWozN8s
 uwi7XjA4SHbiQYPiO4FvAsT3NGkYu3ssn3wwWOlR/KJbH9Yg+eOe5Sj3xC709rwpY1yu
 OQYdp2kQcviqBkj1D2mw0cS5ADMGCRZEyOewY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=Tbwzx0Dn90r7S7YX77dYKaDkXGq/4kEdZV7TAaCUvVs=;
 b=EFEdlaU7fzQ276cQd1i2GFsGEohPYd8QAEdGD4TPqX/bM3INhJFYk3tnfJbid2Sf1G
 g9VUpWaKNV3Thqz6sfbjs4ErnYFi2vNGuL8EMWBQHhcqkn05DeY5BUajmq53vgBAb99W
 Fs1rhzR8Fegoxxo7lq3EFTiCpA/qyUElAQ7TW8iLziwtbFk8ww4NibeDWMK8YuQloPMG
 ME65yNGEZmBcc+M14JXNjpDFLrhyy3JBvWhW1/z1T7FT1kP0O7rLLa/Vp0Ttbv9tQN6A
 5Gb9Y94Tsgm41Z5pYF2Y/2wp263vF5jqAtIqNH/f/ZITv8+F1C0Ak2m8e9xpqA9UBr4O
 HXcg==
X-Gm-Message-State: AOAM533HW/B/nnR4FLNs25KxUWk01SVagGKYvnzQcraJp3JTOTPDUvSo
 hd+t0mHQxxcQ7d9NC26q2XwqpWT39qz9sQ==
X-Google-Smtp-Source: ABdhPJwIhJkgQ7K56pwohcGpwybFFZAgyCAwREfgjiUbje4wUODn1A305mvzKwpWUrHVUvOeEfZ0+w==
X-Received: by 2002:a1c:2645:: with SMTP id m66mr381033wmm.145.1621980505075; 
 Tue, 25 May 2021 15:08:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9654:ad4a:4a61:2e32?
 ([2001:8b0:aba:5f3c:9654:ad4a:4a61:2e32])
 by smtp.gmail.com with ESMTPSA id p2sm17468653wrj.10.2021.05.25.15.08.24
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:08:24 -0700 (PDT)
Message-ID: <0dc10bb052f327dc4c76d01dc70930bebc6bf151.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ltp <ltp@lists.linux.it>
Date: Tue, 25 May 2021 23:08:21 +0100
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_RED
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] Recent Yocto Project LTP experiences (hangs)
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

SGksCgpJIHdhcyBhc2tlZCB0byBzdW1tYXJpc2Ugc29tZSByZWNlbnQgaXNzdWVzIHdlIChZb2N0
byBQcm9qZWN0KSByYW4gaW50byAKd2l0aCBMVFAgcmVjZW50bHkuIFRoaXMgaXMgd2l0aCBsdHAg
dmVyc2lvbiAyMDIxMDEyMS4KClRoZSBlYXNpZXIgb25lIGlzIHN1bW1hcmlzZWQgYXQ6CgpodHRw
czovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9zd2F0L3RvcGljL2Z1cnRoZXJfbHRwX2hhbmdf
a2VybmVsLzgzMDI1Njc0CgpCYXNpY2FsbHkgd2Ugc2F3IG91dCB4ODYgYnVpbGRzIGhhbmdpbmcg
aW4gdGhlIGxvb3BiYWNrIG1vdW50IHRlc3RzCndpdGggYSBsb2FkIG9mIGtlcm5lbCBiYWNrIHRy
YWNlcyBhbmQgcHJvY2Vzc2VzIGluIEQgc3RhdGVzLgpXZSdyZSBydW5uaW5nIHdpdGggdGhlIGlk
ZWEgdGhpcyBpcyBhIDUuMTAuMzcga2VybmVsIGlzc3VlIHdoZW4Kd2UgdXBncmFkZWQgdG8gdGhh
dCBwb2ludCByZWxlYXNlIGFuZCB3ZSB0aGluayB1cGdyYWRpbmcgdG8gNS4xMC4zOCBmaXhlc8Kg
Cml0LiBUaW1lIHdpbGwgdGVsbC4KClRoZSBjb3VwbGUgb2YgaGFyZGVyIG9uZXMgYXJlIHRoZXNl
OgoKQW4gQVJNIGhhbmcgaW4gcHJvYzAxOgoKaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3Jn
L2cvc3dhdC90b3BpYy9kZWJ1Z19kYXRhX2Zvcl9sdHBfcWVtdV9oYW5nLzgyODExNjU3CgphbmQg
c2Vjb25kbHkgYW4geDg2IGhhbmcgaW4gY2dyb3VwX3hhdHRyOgoKaHR0cHM6Ly9saXN0cy55b2N0
b3Byb2plY3Qub3JnL2cvc3dhdC90b3BpYy9kZWJ1Z19kYXRhX2Zvcl9sdHBfcWVtdV9oYW5nLzgy
ODExNjU3CgpUaGUgZGVidWcgZGF0YSB3ZSBoYXZlIGlzIGFib3ZlLiBHaXZlbiB0aGUgcmFuZ2Ug
b2Ygb3RoZXIgImludGVybWl0dGVudCLCoAppc3N1ZXMgd2UgaGF2ZSBpbiBvdXIgYXV0b21hdGVk
IHRlc3RpbmcsIEkgdG9vayB0aGUgYWN0aW9uIHRvIGRpc2FibGUgdGhlIGFib3ZlIHR3bwp0ZXN0
czoKCmh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0LmNnaS9wb2t5L2NvbW1pdC8/aWQ9
YjczYzQ4NGE1OGRiYmRlMzk4OTM5MzE2M2ZjOTY4ZjA2MTA5ODIzYwoKYXMgbm90ZWQgdGhlcmUs
IG9uZSBhZGRpdGlvbmFsIHBpZWNlIG9mIGRhdGEgaXMgdGhhdCB0aGUgcHJvYzAxIHRlc3Qgd2Fz
IGhhZMKgCi9wcm9jL2ttc2cgYXMgYW4gb3BlbiBmaWxlLiBXZSBzYXcgdGhlIHNhbWUgaXNzdWUg
MiBvciAzIHRpbWVzLCBub3QgZXZlcnkgCmJ1dCBtb3N0IGJ1aWxkcy4KCldlJ3JlIG5vdCBsdHAg
ZXhwZXJ0cywgSSBkaWQgdHJ5IGFuZCBkb2N1bWVudCBob3cgd2UgY291bGQgZ2V0IGRhdGEgd2hl
bgpvbmUgb2YgdGhlc2UgaXNzdWVzIG9jY3VycyBoZXJlOgoKaHR0cHM6Ly9saXN0cy55b2N0b3By
b2plY3Qub3JnL2cvc3dhdC90b3BpYy9ob3dfdG9fcHJvdmlkZV9pbmZvX2Zvcl9hLzgzMDA2Nzk0
CgpJZiB0aGVyZSBpcyBleHRyYSBpbmZvcm1hdGlvbiB3ZSBjb3VsZCBiZSBhZGRpbmcgaXQgd291
bGQgYmUgbW9zdCB3ZWxjb21lCmFuZCB3ZSBjYW4gbm90ZSBpdCBmb3IgYW55IGZ1dHVyZSBpc3N1
ZXMuCgpUaGVyZSBpcyB0aGUgcG9zc2liaWxpdHkgdGhhdCB0aGUgaXNzdWVzIGZyb20gdGhlIDUu
MTAuMzcgaXNzdWUgY291bGQKaGF2ZSBjYXVzZWQgdGhlIG90aGVyIGlzc3VlcyBhbmQgdXBncmFk
aW5nIHRoZSBrZXJuZWwgbWF5IGhhdmUgYWRkcmVzc2VkCnRoZW0gYnV0IHJpZ2h0IG5vdyBJJ20g
bm90IGtlZW4gdG8gZXhwZXJpbWVudCB3aXRoIG1vcmUgbG9ja2VkIHVwIHRlc3TCoAppbnN0YW5j
ZXMuIExpa2UgbHRwLCB3ZSdyZSBhIGJpdCBzdHJldGNoZWQgb24gdGhlIHJlc291cmNpbmcgZnJv
bnQgYnV0CkkgZGlkIHdhbnQgdG8gc2hhcmUgd2hhdCB3ZSBoYXZlLgoKQ2hlZXJzLAoKUmljaGFy
ZAoKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3Rp
bmZvL2x0cAo=
