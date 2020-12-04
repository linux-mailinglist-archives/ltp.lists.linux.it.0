Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 193CD2CE794
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 06:35:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C8E313C2B88
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 06:35:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D5D673C2B6E
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 06:35:51 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8790C10000CD
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 06:35:51 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 4DECB9F6B9;
 Fri,  4 Dec 2020 05:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1607060150; bh=CrbUn9cKWLJ2eV+euuG1aiB+V5oZQza3dPW10T1kO7U=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=aMI6jSI7/vbp6++mpHdzvkjhyj6ofIolzcdO4fi7gaGfxsBPaUoNSePg3ckgrbviy
 0QSSpq+kMWEbZDzN6laW/pTtt9dOyZzk3FyCVeqUGTVSrVzCfkDaE0pVIBHARxLTML
 LCovGeEcBQ1E349pu6HSMWW9YOQcFS/SzqOaH2PI=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20201127071419.20370-1-lkml@jv-coder.de>
 <20201203153030.GE5809@yuki.lan>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <f17f7936-5fd2-b217-e945-1409d9d40eeb@jv-coder.de>
Date: Fri, 4 Dec 2020 06:35:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201203153030.GE5809@yuki.lan>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3] overcommit_memory: Fix unstable subtest
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

SGkgQ3lyaWwsCj4gVGhpcyB2ZXJzaW9uIGxvb2tzIGJldHRlci4gSG93ZXZlciB0d28gKG1pbm9y
KSBjb21tZW50cyBmb3IgdGhpcwo+IGZ1bmN0aW9uIHN0aWxsIGFwcGx5LgpJJ2xsIHJlc3BvbmQg
dG8gdGhlIGNvbW1lbnRzIGhlcmU6Cj4gV2h5IGRvbid0IHdlIHB1dCB0aGUgZmlyc3QgYXJndW1l
bnQgb24gdGhlIHNhbWUgbGluZSBhcyB0aGUgTUFYKCBvciBNSU4oCj4gaGVyZT8gVGhhdCB3b3Vs
ZCBiZSBtdWNoIG1vcmUgY29tcGFjdCBidXQgc3RpbGwgbmljZWx5IHJlYWRhYmxlLgpXaWxsIGNo
YW5nZSB0aGF0Cj4gSSBkbyB3b25kZXIsIGFyZSB0aGUgY291bnRlcnMgZmx1c2hlZCBpZiB0YXNr
IGlzIG1pZ3JhdGVkIGJldHdlZW4gQ1BVcz8KPiBJZiBzbyB3ZSB3b3VsZG4ndCBuZWVkIHRoZSBt
dWx0aXBsaWNhdGlvbiBieSBiY3B1cy4KSUlSQywgbm8gdGhleSBhcmUgbm90IGZsdXNoZWQgYW5k
IHRoZXJlIHdvdWxkbid0IGJlIGFueSByZWFzb24gZm9yIHRoYXQuIApUaGVzZSBjb3VudGVycyBh
cmUgbm90IHN1cHBvc2VkIHRvIGFjY291bnQgcGVyIGNwdSBzdGF0aXN0aWNzLCB0aGV5IGFyZSAK
anVzdCB1c2VkIHRvIHByZXZlbnQgbG9jayBjb250ZW50aW9uLiBJZiBhIHRhc2sgaXMgbWlncmF0
ZWQgdG8gYW5vdGhlciAKY3B1IGFuZCBpdCdzIG1lbW9yeSBpcyBmcmVlZCB0aGVyZSwgdGhlIGNv
dW50ZXIgbWF5IGJlY29tZSBuZWdhdGl2ZSwgCndoaWNoIGlzIHBlcmZlY3RseSBmaW5lLgpBZGRp
dGlvbmFsbHkgdGhpcyB0b3RhbCBiYXRjaCBzaXplIGlzIHRoZSBtYXhpbXVtIGFtb3VudCwgdGhl
IGdsb2JhbCAKY291bnRlciBjYW4gZGV2aWF0ZSBmcm9tIHRoZSByZWFsIHZhbHVlLiBUaGlzIHRh
a2VzIGludG8gYWNjb3VudCBhbGwgCnByb2Nlc3NlcyBydW5uaW5nIG9uIGFsbCBjcHVzLCBiZWNh
dXNlIHRoZSBvdmVyY29tbWl0IGxpbWl0IGlzIGEgZ2xvYmFsIApsaW1pdCwgbm90IGEgcGVyIHRh
c2sgb25lLgo+IENhbiB3ZSBwbGVhc2UgY2FsbCB0aGUgZ2V0X3RvdGFsX2JhY2tfc2l6ZV9ieXRl
cygpIGluIHRoZSB0ZXN0IHNldHVwIGFuZAo+IHN0b3JlIHRoZSB2YWx1ZS4KSSB0aGluayBJIGxl
ZnQgdGhpcyBpbiB0aGUgdGVzdCBmdW5jdGlvbiwgYmVjYXVzZSB0aGVyZSBpcyBhIHNsaWdodCAK
Y2hhbmNlLCB0aGF0IHRoZSB2YWx1ZSBjaGFuZ2VzIG92ZXIgdGltZSBkdWUgdG8gaG90cGx1Zy4g
SWYgY3B1cyBhcmUgCmFkZGVkIChyZWFsbHkgcGx1Z2dlZCBpbnRvIHRoZSBzeXN0ZW0sIG5vdCBv
bmx5IGVuYWJsZWQpIG9yIGlmIHRoZXJlIGlzIAptZW1vcnkgYWRkZWQsIHRoZSB2YWx1ZSBjaGFu
Z2VzLiBJbiB2bXMgd2l0aCBtZW1vcnkgYmFsbG9vbmluZywgSSB0aGluayAKdGhpcyBpcyBtb3Jl
IGxpa2VseSB0byBoYXBwZW4uIFRoZSBjb3N0IGlzIG5vdCB2ZXJ5IGhpZ2gsIHNvIHdoeSBhZGQg
dGhlIApwb3NzaWJsaXR5IHRvIGJyZWFrIHRoaXM/CgpJZiB5b3UgYXJlIG9rIHdpdGggbWUgb25s
eSBjaGFuZ2luZyB0aGUgZm9ybWF0dGluZyBvZiB0aGUgTUlOL01BWCBzdHVmZiwgCkknbGwgc2Vu
ZCBhIHY0LgoKSsO2cmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
