Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D46D12C506C
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 09:30:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 36F9E3C4E2C
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 09:30:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id A73843C2451
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 09:30:53 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 09AC3600C7E
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 09:30:52 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 00A99A0815;
 Thu, 26 Nov 2020 08:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1606379451; bh=z+cenvX1zxAwcxNvKf3BVCK9zENB9WJrWCUhD4l9nJU=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=bXXfM/1bpk7EbFsg3BQqd2KHadtfuLIcKAkNC7COedCFUsYsJhflu+n/oBUCBrUnS
 igMvZOv3dGSEZzRLerkQd3hJs9v+6CpH7UsSh6FECbPSvlXhlrCdYZWGXBnOT9bDsA
 1YfpxNb8dg3HmDVAVjzFnlhEPU5jSjJBJv7a6h3Y=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20201119095227.921830-1-lkml@jv-coder.de>
 <20201119113816.GH2785@yuki.lan>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <8dc13989-88bf-1727-1dbd-83a2163ffb03@jv-coder.de>
Date: Thu, 26 Nov 2020 09:30:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201119113816.GH2785@yuki.lan>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] realtime/m4: Re-add define for robust mutexattr
 APIs
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
Cc: ltp@lists.linux.it, Mathias Fiedler <mathias.fiedler@aox-tech.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpPbiAxMS8xOS8yMDIwIDEyOjM4IFBNLCBDeXJpbCBIcnViaXMgd3JvdGU6Cj4gSGkhCj4g
VGhlIGNvZGUgc3dpdGNoZWQgdG8gdGhlIFBPU0lYIHZhcmlhbnRzIGxhdGVyIG9uIHNvIEkgd29u
ZGVyIGlmIHdlIGV2ZW4KPiBuZWVkIHRoaXMgY29uZmlndXJlIGNoZWNrIG9yIGlmIHdlIGNhbiBy
ZW1vdmUgdGhlIGlmZGVmcyBmcm9tIHRoZQo+IHRlc3RjYXNlcyBjb21wbGV0ZWx5LgplaXRoZXIg
dGhhdCBvciB0aGlzIHBhdGNoLiBBdCBsZWFzdCBhdCB0aGUgbW9tZW50IHRoZXNlIHRlc3RzIGFy
ZSAKY29tcGxldGVseSBicm9rZW4uCkkgYW0gbm90IHN1cmUgaG93IGxvbmcgcHRocmVhZF9tdXRl
eGF0dHJfKnJvYm91c3QqIGFwaSBpcyBwYXJ0IG9mIHBvc2l4IAphbmQgaWYgbHRwIGlzIHN1cHBv
c2VkIHRvIGJlIHN1cHBvcnRlZCBvbiBwbGF0Zm9ybXMsIHRoYXQgbWF5IG5vdCAKaW1wbGVtZW50
IGl0LgoKQnV0IHNob3VsZCBhY2NlcHRpbmcgdGhpcyBwYXRjaCB3b3VsZG4ndCBkbyBhbnkgaGFy
bSBmb3Igbm93LCBidXQgd291bGQgCmZpeCB0aGUgdGVzdHMuIEluIHRoZSBmdXR1cmUgaXQgY2Fu
IHN0aWxsIGJlIHJlbW92ZWQgY29tcGxldGVseS4KCkrDtnJnCgpQUzogQEN5cmlsIFNvcnJ5IGZv
ciB0aGUgcmVzZW5kaW5nIHRoaXMsIGZvcmdvdCB0byBpbmNsdWRlIHRoZSBtYWlsIGxpc3QKCgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==
