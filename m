Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C707718822A
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 12:26:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57E263C55D9
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 12:26:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 4BAF03C0BA3
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 12:26:27 +0100 (CET)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6E19C1A0146C
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 12:26:26 +0100 (CET)
Received: by mail-pf1-x442.google.com with SMTP id l184so11773880pfl.7
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 04:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=pl9zm8Ft0Ixi4DiUodrbkdNH3Wdhv22JCYSHCKjC0Yo=;
 b=bPUlQjfYhIN7zPLSZU31jnp7pFUKe5z+UTfqCz2muS3TzwtgTAiv1lgXdpQ22eDbaI
 yT1PMyApev1MSYAAqppVHQAY6AJIaZA9TBUmsprQxfPVX8TTpgzukG/9rAJ9dqn19Ea0
 D+rdgDZfDG8mItw1dwNyEESKHuDV6RW74C36abc6SZfbdtVwuKpWuzX4IVOw+tuDI6fJ
 9txE23xsQsHpnCv9sjZMN76MEeoIXX6Ddro1Rcz3x3b+xhF5eirDcrUeHWIGUP4F2s2j
 1BOGsuDcXJJ53orPkQL7bOEqRRjCeHGbO22neGLpSBOkAiBd9gcv9v25jJmMaEiKLIcK
 4ICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=pl9zm8Ft0Ixi4DiUodrbkdNH3Wdhv22JCYSHCKjC0Yo=;
 b=lCnYe39g0K3tAKA8a7OfByEEfBVd09QYvtmpvFx1Q4pcj9K9LrW3oy1rLF+gZH/r4p
 7idVg+30Z7PzQb3mOCAxpDGr/6Jkxl4fQ/P/xz20SaYGRHylNxadtVvnFr0wnKnSCV6V
 1yReURpHaoYKKKMsigUFONAgW5fl+serdsLoqCuUmo2dtTMU+yjNF/HkbWEkhuFtWUTV
 Y6vO71vZhNCb3Jq1eDuFXBJj6haTbBan128ib48QsUhBKJ3b7y0gzH/NHLkVG0LzR9r/
 rwux2FDH/GtuD4MbtKAbgnAlVs6AqOlcKvbWL4kphQkOFbYIVs7ie/4PoLZ56Xk123t8
 vUEA==
X-Gm-Message-State: ANhLgQ21dxidvU8bnniLyjYbIgFxSTATw2zBiY22+UAOQKsGKst8KYhp
 jY8pHvpHNSzWmuJIcaHOMlo=
X-Google-Smtp-Source: ADFU+vuyYUcgaMP6Tu85gYQMEFMXOr3ZpsvjHCKhVreOdQRofFmVPtQaSjlcCwCsUTp5PJc/nFiYUA==
X-Received: by 2002:aa7:8f03:: with SMTP id x3mr1016326pfr.40.1584444384859;
 Tue, 17 Mar 2020 04:26:24 -0700 (PDT)
Received: from [192.168.21.6] (c-73-19-52-228.hsd1.wa.comcast.net.
 [73.19.52.228])
 by smtp.gmail.com with ESMTPSA id a24sm2912260pfl.115.2020.03.17.04.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2020 04:26:23 -0700 (PDT)
From: Enji Cooper <yaneurabeya@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 17 Mar 2020 04:26:22 -0700
Message-Id: <21681327-BC61-4A15-8980-AA1A6402C863@gmail.com>
References: <1584430400-47359-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1584430400-47359-1-git-send-email-zou_wei@huawei.com>
To: Zou Wei <zou_wei@huawei.com>
X-Mailer: iPhone Mail (17D50)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open_posix_testsuite: Enable the testsuite
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

TkFLLgoKVGhpcyB3aWxsIGJ1aWxkIHRoZSBzdWl0ZSBvbiB0aGUgYnVpbGQgaG9zdCwgd2hpY2gg
aW5jbHVkZXMgYSBudW1iZXIgb2YgYnVpbGQgdGltZSB0ZXN0cywgd2hpY2ggd2lsbCBzbG93IGRv
d24gaG9zdHMgYW5kIAoKSXTigJlzIGJldHRlciB0byBmbGlwIHRoZSBkZWZhdWx0IGluIGNvbmZp
Z3VyZSwgYnV0IEkgdGhpbmsgdGhlIGJ1aWxkIG1hY2hpbmVyeSBuZWVkcyB0byBiZSByZXdvcmtl
ZCBzbyBydW50aW1lIHRlc3RzIGFuZCBidWlsZCBhbmQgaW5zdGFsbGVkIGFuZCBidWlsZCB0aW1l
IHRlc3RzIGFyZSBqdXN0IGluc3RhbGxlZC4KCi1FbmppCgo+IE9uIE1hciAxNywgMjAyMCwgYXQg
MDA6MjcsIFpvdSBXZWkgPHpvdV93ZWlAaHVhd2VpLmNvbT4gd3JvdGU6Cj4gCj4g77u/RW5hYmxl
IG9wZW4gcG9zaXggdGVzdHN1aXRlIGNvbXBpbGF0aW9uIGJ5IGRlZmF1bHQKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBab3UgV2VpIDx6b3Vfd2VpQGh1YXdlaS5jb20+Cj4gLS0tCj4gdGVzdGNhc2VzL01h
a2VmaWxlIHwgNCAtLS0tCj4gMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3Rlc3RjYXNlcy9NYWtlZmlsZSBiL3Rlc3RjYXNlcy9NYWtlZmlsZQo+IGluZGV4
IGIwNGU2MzAuLmFlMWNhZmMgMTAwNjQ0Cj4gLS0tIGEvdGVzdGNhc2VzL01ha2VmaWxlCj4gKysr
IGIvdGVzdGNhc2VzL01ha2VmaWxlCj4gQEAgLTMwLDEwICszMCw2IEBAIGluY2x1ZGUgJCh0b3Bf
c3JjZGlyKS9pbmNsdWRlL21rL2Vudl9wcmUubWsKPiAjICAgIHJ1bikuCj4gRklMVEVSX09VVF9E
SVJTICAgICAgICA6PSBrZHVtcAo+IAo+IC1pZm5lcSAoJChXSVRIX09QRU5fUE9TSVhfVEVTVFNV
SVRFKSx5ZXMpCj4gLUZJTFRFUl9PVVRfRElSUyAgICAgICAgKz0gb3Blbl9wb3NpeF90ZXN0c3Vp
dGUKPiAtZW5kaWYKPiAtCj4gaWZuZXEgKCQoV0lUSF9SRUFMVElNRV9URVNUU1VJVEUpLHllcykK
PiBGSUxURVJfT1VUX0RJUlMgICAgICAgICs9IHJlYWx0aW1lCj4gZW5kaWYKPiAtLQo+IDIuNi4y
Cj4gCj4gCj4gLS0gCj4gTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQv
bGlzdGluZm8vbHRwCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCg==
