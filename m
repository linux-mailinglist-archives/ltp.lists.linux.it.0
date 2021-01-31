Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 590C1309B00
	for <lists+linux-ltp@lfdr.de>; Sun, 31 Jan 2021 08:51:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D0863C7598
	for <lists+linux-ltp@lfdr.de>; Sun, 31 Jan 2021 08:51:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 96A8F3C201D
 for <ltp@lists.linux.it>; Sun, 31 Jan 2021 08:51:47 +0100 (CET)
Received: from mail-m971.mail.163.com (mail-m971.mail.163.com [123.126.97.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1C90A1A00780
 for <ltp@lists.linux.it>; Sun, 31 Jan 2021 08:51:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=ZrRlx
 j1/ZDdphvK+2XyRoTQoOl1wVHxvUVfO8kuoeyk=; b=lc+ra+Ki1oj51VSgDRJfv
 Xk/ODdEtfx4AvQ2tawkHNrVgDV3i0sD5/6fsI40ZVI6ZxnqX/rVndZdNgIU+EqVf
 +eHTK1FZV5blju56J0ELXonQudZ8TD+BFUuAyeHdlOt+ovRSu1t84M2WPpNN8fai
 qB3j2BWp2QxSS9Q+UUAmng=
Received: from [172.20.10.4] (unknown [122.194.0.179])
 by smtp1 (Coremail) with SMTP id GdxpCgDnyHyHYRZg7zLrBQ--.155S2;
 Sun, 31 Jan 2021 15:51:40 +0800 (CST)
To: Cyril Hrubis <chrubis@suse.cz>, Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <20201214063729.1656200-1-yangx.jy@cn.fujitsu.com>
 <20210126022631.2566169-1-yangx.jy@cn.fujitsu.com>
 <YBQL7EiQNkqv7nuV@yuki.lan>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <80aca9cc-2a64-cd12-90b1-a00148805a7d@163.com>
Date: Sun, 31 Jan 2021 15:51:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <YBQL7EiQNkqv7nuV@yuki.lan>
Content-Language: en-US
X-CM-TRANSID: GdxpCgDnyHyHYRZg7zLrBQ--.155S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw4DKw1UXr1kZw4UGFWUtwb_yoWxAFg_Ww
 1Yk34FgayvgFZ3t3WftF43Jwsrt3W0yFyYg3s8WFZ5W34UJFZYyrWkJF95GryfGaySka4f
 CFyqg3yIvas8ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0Q_-PUUUUU==
X-Originating-IP: [122.194.0.179]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiEAwrXl8YE4yOZAAAsb
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls/sched_getparam{01,
 02}: Convert to new API and cleanup
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMS8yOS8yMSA5OjIxIFBNLCBDeXJpbCBIcnViaXMgd3JvdGU6Cj4gSGkhCj4+ICsJCWlmIChw
YXJhbS5zY2hlZF9wcmlvcml0eSkgewo+PiArCQkJdHN0X3JlcyhURkFJTCwKPj4gKwkJCQkic2No
ZWRfZ2V0cGFyYW0oJWQpIGdvdCB3cm9uZyBzY2hlZF9wcmlvcml0eSAlZCwgZXhwZWN0ZWQgMCIs
Cj4+ICsJCQkJcGlkc1tuXSwgcGFyYW0uc2NoZWRfcHJpb3JpdHkpOwo+PiArCQkJZXhpdCgxKTsK
PiBJIGRvIG5vdCB0aGluayB0aGF0IHdlIHNob3VsZCBkbyBleGl0KDEpIGhlcmUsIHNpbmNlIHRo
YXQgd291bGQgY2F1c2UKPiBUQlJPSyBpbiB0aGUgbGlicmFyeSB3aGVuIHdlIHJlYXAgdGhlIGNo
aWxkcmVuLiBUaGUgZmFpbHVyZSBpcwo+IHByb3BhZ2F0ZWQgYnkgdGhlIHRzdF9yZXMoVEZBSUws
IC4uLikgaGVyZSBhbHJlYWR5Lgo+Cj4gV2l0aCB0aGUgZXhpdCgxKSByZXBsYWNlZCBieSBleGl0
KDApOgo+Cj4gCVJldmlld2VkLWJ5OiBDeXJpbCBIcnViaXMgPGNocnViaXNAc3VzZS5jej4KCkhp
IEN5cmlsLAoKVGhhbmtzIGZvciB5b3VyIGNvbW1lbnQuwqAgUHVzaGVkIHdpdGggdHdvIG1pbm9y
IGNoYW5nZXM6CgpSZXBsYWNlZCBleGl0KDEpIGFuZCB1cGRhdGVkIGRlc2NyaXB0aW9uIGluIHNj
aGVkX2dldHBhcmFtMDEuCgpCZXN0IFJlZ2FyZHMsCgpYaWFvIFlhbmcKCj4KCgotLSAKTWFpbGlu
ZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
