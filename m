Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FB433EDE7
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 11:03:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 343083C2D51
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 11:03:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 3B8E93C2CF7
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 11:03:54 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D88B3200CE7
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 11:03:53 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.4.45])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 7F1E19F7F6;
 Wed, 17 Mar 2021 10:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1615975432; bh=WgoYpMFdsFIDkhn6G7IMeLGvrotA1vdVR67vkfCb7y8=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=Mmk+maQlseWLimLp09pKeklklwB+LxIYA8dQDuLxZJGEwG5y0BiHXIkxXHM15zksQ
 Gpc01DtU0KjdznB7hGqOgRWhDQJ8CtiZWxSq0zU5q/urRors2vsINK8w7OO76aDRuN
 Y2QtkwK6TtUuOVbdQLl7hW/4YDU1YXhyMAyu0tpI=
To: Petr Vorel <pvorel@suse.cz>
References: <20210315092844.991073-1-lkml@jv-coder.de> <YFHNDN1CEcBo6oMG@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <87117f6f-58e7-8b68-38c3-be5b080e86b6@jv-coder.de>
Date: Wed, 17 Mar 2021 11:05:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFHNDN1CEcBo6oMG@pevik>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] pec: Convert to the new API
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUGV0ciwKCk9uIDMvMTcvMjAyMSAxMDozNCBBTSwgUGV0ciBWb3JlbCB3cm90ZToKPiBCVFc6
IHdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gcmVuYW1lIHJ1bnRlc3QvY29ubmVjdG9ycyB0byBydW50
ZXN0L25ldGxpbmsKPiBhbmQgbW92ZSBjb2RlIGZyb20gdGVzdGNhc2VzL2tlcm5lbC9jb25uZWN0
b3JzLyB0byB0ZXN0Y2FzZXMva2VybmVsL25ldGxpbmsvPwpNYXliZSBrZXJuZWwvbmV0bGluay9j
b25uZWN0b3IvLiBDb25uZWN0b3IgaXMgYW4gYWJzdHJhY3Rpb24gb24gdG9wIG9mIApuZXRsaW5r
IHdpdGggYSBzbGlnaHRseQpkaWZmZXJlbnQgaW50ZXJmYWNlIHRoYW4gcHVyZSBuZXRsaW5rIChl
Zy4gY25fbXNnIGluc3RlYWQgb2Ygbmxtc2doZHIpLgpUaGVyZSBhcmUgb25seSB2ZXJ5IGZldyBv
dGhlciBtb2R1bGVzLCB0aGF0IHVzZSB0aGlzIGludGVyZmFjZSBhdCB0aGUgCm1vbWVudCAoTVMg
SHlwZXJWLCBNRCzCoCB1dmVzYWZiwqAgYW5kIGRhbGxhcycgMS13aXJlKS4KClRoZSBxdWVzdGlv
biBpczogSXMgdGhlIGludGVyZmFjZSB0aGUgY29ycmVjdCB0aGluayB0byBjYXRlZ29yaXplIGJ5
PyBJZiAKdGhlIGludGVyZmFjZSAoaS5lLiBuZXRsaW5rKSBpcyB1c2VkIGZvciBjYXRlZ29yaXph
dGlvbiwgdGhlbiBzb21lIG9mIAp0aGUgY3J5cHRvIHRlc3RzIHNob3VsZCBhbHNvIGJlIGluIHRo
aXMgbmV0bGluayBjYXRlZ29yeS4KCkrDtnJnCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
