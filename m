Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC66215E5F
	for <lists+linux-ltp@lfdr.de>; Tue,  7 May 2019 09:41:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89C493EA3EF
	for <lists+linux-ltp@lfdr.de>; Tue,  7 May 2019 09:41:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 4586A3EA063
 for <ltp@lists.linux.it>; Tue,  7 May 2019 09:41:00 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1C851602321
 for <ltp@lists.linux.it>; Tue,  7 May 2019 09:40:51 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id b3so7731244plr.7
 for <ltp@lists.linux.it>; Tue, 07 May 2019 00:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mbobrowski-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=B6R4A57E6BDF/lorH22GH5tVhGXLu+83ZVQ9YGruqfI=;
 b=tvvRzFExkp0j8zPGzvhNdZGPiDHWTdQAi0gMRrOc0YNBxW2RblzTSk8zqoomBMIYfj
 CdrGsU3BISHgFnNoElILtQA8YtcpfGVuk91g9m3iTue4jzk90RdTCSvKvdUXAgsmH9JL
 ZMthBpgX/bIyj9jmHDDKjbzTucV4jpg1Ov9jnUhAXHgErZP42ULYE1UQ3zG/cetP3u9y
 Q4/Pa2SVc0JB6ixJVEbKgTv0vTpTmHidMJ8rp/egSfSQzBgPbOd0faKYGwbdtYBPlpvm
 CZ3bOgNCjKfQ73/OV8B3Px9Dxqkwjld3eHH+Ca93JdXjK2nXeW90ImqHPMEDCwYK05LQ
 lEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=B6R4A57E6BDF/lorH22GH5tVhGXLu+83ZVQ9YGruqfI=;
 b=YK2iiRytGJ3y0Psiz/tN6uF//sfhm9QlBW2yLCsqqBfv27/SCM7aGDsmV0gZZSjwRk
 /bgYauYhqUZZ57ngDJSU2np0oRX3I/58Wj+qz29CXmMyZuQu5fyWSruz17BZH9kRNfQ7
 tJref37UIENLzn+GFfCGLfFF5XyBFdLtsMJsmET1N1hE1VbMopcldWFKS6LW/aPlNjhO
 aWKKnADVy9CR9hitt2/D/5vTOKOfXKRKlO6+MIRgegmOz2RLFfOfm7tHJ7+YfoHMwRzj
 NMe0+qlPnJWk9OM1FXebNg4VgvCa+CBbrVphX3rT/iweyeqffMIql2SBJi8iITD7rl1+
 pCZQ==
X-Gm-Message-State: APjAAAU94QCm36EGZwgap+vAUgE+qQzREu0oP7yp1pOWepVoS3ulZXVY
 a3nCb9k9ditKi5RRrKksTWp4
X-Google-Smtp-Source: APXvYqwhtAHwjSjOl9wBxwLRrCpBUaSWEb2RgH4GSaaL+MuXTSdvtdlZ4khanIdCS7J2gep/zkM2ow==
X-Received: by 2002:a17:902:1e3:: with SMTP id
 b90mr18552705plb.182.1557214850397; 
 Tue, 07 May 2019 00:40:50 -0700 (PDT)
Received: from lithium.mbobrowski.org ([103.230.158.220])
 by smtp.gmail.com with ESMTPSA id j32sm14605696pgi.73.2019.05.07.00.40.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 00:40:49 -0700 (PDT)
Date: Tue, 7 May 2019 17:40:44 +1000
From: Matthew Bobrowski <mbobrowski@mbobrowski.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190507074042.GC12903@lithium.mbobrowski.org>
References: <cover.1555763787.git.mbobrowski@mbobrowski.org>
 <6639dd7a9ff9929ce79f4f353f3e1db075594ea2.1555763787.git.mbobrowski@mbobrowski.org>
 <20190426152748.GA31769@rei.lan>
 <20190427045341.GA3894@lithium.mbobrowski.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190427045341.GA3894@lithium.mbobrowski.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: jack@suse.cz, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 1/3] syscalls/fanotify13: new test to verify
 FAN_REPORT_FID functionality
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

SGkgQ3lyaWwsCgpBbnkgZmVlZGJhY2sgb24gdGhlIGJlbG93PwoKT24gU2F0LCBBcHIgMjcsIDIw
MTkgYXQgMDI6NTM6NDRQTSArMTAwMCwgTWF0dGhldyBCb2Jyb3dza2kgd3JvdGU6Cj4gT24gRnJp
LCBBcHIgMjYsIDIwMTkgYXQgMDU6Mjc6NDhQTSArMDIwMCwgQ3lyaWwgSHJ1YmlzIHdyb3RlOgo+
ID4gSGkhCj4gPiBJJ3ZlIHRyaWVkIHRoZXNlIHRlc3RzIG9uIGJ1aWxkc2VydmljZSB0byBjaGVj
ayB0aGF0IHRoZXJlIGFyZSBubwo+ID4gcHJvYmxlbXMgb24gc2xpZ2h0bHkgb2xkZXIgZGlzdHJp
YnV0aW9ucyBhbmQgZm91bmQgdHdvLgo+ID4gCj4gPiBUaGUgZmlyc3Qgb25lIGlzIHRoYXQgd2Ug
ZG8gZGVmaW5lIGZhbGxiYWNrIGRlZmluaXRpb25zIGluIGZhbm90aWZ5LmgKPiA+IGJ1dCB0aGVu
IGlmZGVmIHRoZSB3aG9sZSB0ZXN0IGNvZGUgaW4gI2lmIGRlZmluZWQoSEFWRV9TWVNfRkFOT1RJ
RllfSCkKPiA+IHNvIHRoYXQgaXQncyBlZmVjdGl2ZWx5IGRpc2FibGVkIG9uIG9sZGVyIGRpc3Ry
b3MgZXZlbiB3aXRoIGZhbGxiYWNrCj4gPiBkZWZpbml0aW9ucyBpbiBwbGFjZS4gQWxzbyBpdCdz
IFRTVF9URVNUX1RDT05GKCkgYnV0IHRoYXQgaXMganVzdCBlYXN5Cj4gPiB0byBmaXggdHlwby4g
SSBndWVzcyB0aGF0IHdlIGNhbiByZW1vdmUgdGhlIGlmZGVmIGFuZCBzeXMvZmFub3RpZnkuaAo+
ID4gaW5jbHVkZSBmcm9tIHRoZSB0ZXN0IHNvdXJjZXMgc2luY2Ugd2UgY29uZGl0aW9uYWxseSBp
bmNsdWRlIHRoZQo+ID4gc3lzL2Zhbm90aWZ5LmggaW4gdGhlIGxvY2FsIGZhbm90aWZ5LmggYWxy
ZWFkeS4KPiAKPiBPSy4gSW4gdGhhdCBjYXNlIEkgY2FuIHdyaXRlIGEgcGF0Y2ggdGhhdCBpcyB0
byBiZSBhcHBsaWVkIHByaW9yIHRvIHRoaXMgc2VyaWVzCj4gd2hpY2ggZXNzZW50aWFsbHkganVz
dCByZW1vdmVzIHRoaXMgc3BlY2lmaWMgcHJlcHJvY2Vzc29yIGNvbmRpdGlvbmFsIGRpcmVjdGl2
ZQo+IGZyb20gYWxsIHRoZSBzb3VyY2UgZmlsZXMuIFdvdWxkIHlvdSBsaWtlIG1lIHRvIGRvIHRo
aXM/Cj4gIAo+ID4gVGhlIHNlY29uZCBvbmUgaXMgdGhhdCB3ZSBmYWlsIHRvIGNvbXBpbGUgb24g
b2xkZXIgZGlzdHJpYnV0aW9ucyBiZWNhdXNlCj4gPiBvZiBtaXNzaW5nIG5hbWVfdG9faGFuZGxl
X2F0KCkgc28gd2UgbmVlZCBjb25maWd1cmUgY2hlY2sgZm9yIHRoYXQKPiA+IHN5c2NhbGwgYW5k
IGZhbGxiYWNrIGRlZmluaXRpb24gaW4gbGFwaS8gaGVhZGVyLCBvciBhdCBsZWFzdCBjb25maWd1
cmUKPiA+IGNoZWNrIGFuZCBpZmRlZiBpbiB0aGUgZmFub3RpZnlfZ2V0X2ZpZCgpIGZ1bmN0aW9u
LiBXaGljaCBzaG91bGQgYmUgYXMKPiA+IGVhc3kgYXMgYWRkaW5nIGEgbmFtZV90b19oYW5kbGVf
YXQgbGluZSB0byBBQ19DSEVDS19GVU5DUygpIGluIHRoZQo+ID4gY29uZmlndXJlLmFjIGFuZCB1
c2luZyB0aGUgbWFjcm8gZnJvbSBjb25maWcuaC4KPiAKPiBTdXJlLiBJJ3ZlIGdvbmUgYWhlYWQg
YW4gdXBkYXRlZCBpdCB0byBhY2NvbW1vZGF0ZSBmb3IgdGhpcy4gUHJpb3IgdG8KPiBzdWJtaXR0
aW5nIHRocm91Z2ggYW5vdGhlciBwYXRjaGVzIHNlcmllcywgY2hhbmdlcyBjYW4gYmUgZm91bmQg
aGVyZToKPiBodHRwczovL2dpdGh1Yi5jb20vbWF0dGhld2JvYnJvd3NraS9sdHAvY29tbWl0LzU0
MjY0ZGIwZTU3NGQyZjkwZTcxNmE1MTBmY2IxZGExMWVlMTc0ZGMuCj4gCj4gSSB0aGluayB3ZSBj
YW4gZG8gYmV0dGVyIGFuZCBhbHNvIHByb3ZpZGUgYSBmYWxsYmFjayBkZWZpbml0aW9uIHRob3Vn
aCwKPiB0aG91Z2h0cz8gRG9uJ3QgYmVsaWV2ZSB0aGF0IGl0IHdvdWxkIHRha2UgbXVjaCBlZmZv
cnQuIAo+ICAKPiA+ID4gZGlmZiAtLWdpdCBhL3J1bnRlc3Qvc3lzY2FsbHMgYi9ydW50ZXN0L3N5
c2NhbGxzCj4gPiA+IGluZGV4IDJiOGNhNzEuLmRmZGM2Y2IgMTAwNjQ0Cj4gPiA+IC0tLSBhL3J1
bnRlc3Qvc3lzY2FsbHMKPiA+ID4gKysrIGIvcnVudGVzdC9zeXNjYWxscwo+ID4gPiBAQCAtNTM3
LDYgKzUzNyw3IEBAIGZhbm90aWZ5MDkgZmFub3RpZnkwOQo+ID4gPiAgZmFub3RpZnkxMCBmYW5v
dGlmeTEwCj4gPiA+ICBmYW5vdGlmeTExIGZhbm90aWZ5MTEKPiA+ID4gIGZhbm90aWZ5MTIgZmFu
b3RpZnkxMgo+ID4gPiArZmFub3RpZnkxMyBmYW5vdGlmeTEzCj4gPiA+ICAKPiA+ID4gIGlvcGVy
bTAxIGlvcGVybTAxCj4gPiA+ICBpb3Blcm0wMiBpb3Blcm0wMgo+ID4gPiBkaWZmIC0tZ2l0IGEv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS8uZ2l0aWdub3JlIGIvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS8uZ2l0aWdub3JlCj4gPiA+IGluZGV4IDQyNTZiOGMu
LjE2YmRkOTkgMTAwNjQ0Cj4gPiA+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFu
b3RpZnkvLmdpdGlnbm9yZQo+ID4gPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zh
bm90aWZ5Ly5naXRpZ25vcmUKPiA+ID4gQEAgLTEwLDQgKzEwLDUgQEAKPiA+ID4gIC9mYW5vdGlm
eTEwCj4gPiA+ICAvZmFub3RpZnkxMQo+ID4gPiAgL2Zhbm90aWZ5MTIKPiA+ID4gKy9mYW5vdGlm
eTEzCj4gPiA+ICAvZmFub3RpZnlfY2hpbGQKPiA+ID4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkuaCBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvZmFub3RpZnkvZmFub3RpZnkuaAo+ID4gPiBpbmRleCAxNDY1NGI3Li5lOWIyM2NjIDEw
MDY0NAo+ID4gPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90
aWZ5LmgKPiA+ID4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5v
dGlmeS5oCj4gPiA+IEBAIC0yOSw2ICsyOSwxMSBAQAo+ID4gPiAgI2RlZmluZQlfX0ZBTk9USUZZ
X0hfXwo+ID4gPiAgCj4gPiA+ICAjaW5jbHVkZSAiY29uZmlnLmgiCj4gPiA+ICsjaW5jbHVkZSA8
c3lzL3N0YXRmcy5oPgo+ID4gPiArI2luY2x1ZGUgPHN5cy90eXBlcy5oPgo+ID4gPiArI2luY2x1
ZGUgPHN5cy9zdGF0Lmg+Cj4gPiA+ICsjaW5jbHVkZSA8ZXJybm8uaD4KPiA+ID4gKyNpbmNsdWRl
IDxmY250bC5oPgo+ID4gPiAgCj4gPiA+ICAjaWYgZGVmaW5lZChIQVZFX1NZU19GQU5PVElGWV9I
KQo+ID4gPiAgCj4gPiA+IEBAIC01Nyw5ICs2Miw2IEBAIHN0YXRpYyBsb25nIGZhbm90aWZ5X21h
cmsoaW50IGZkLCB1bnNpZ25lZCBpbnQgZmxhZ3MsIHVpbnQ2NF90IG1hc2ssCj4gPiA+ICAjaWZu
ZGVmIEZBTl9SRVBPUlRfVElECj4gPiA+ICAjZGVmaW5lIEZBTl9SRVBPUlRfVElECQkweDAwMDAw
MTAwCj4gPiA+ICAjZW5kaWYKPiA+ID4gLSNpZm5kZWYgRkFOX1JFUE9SVF9GSUQKPiA+ID4gLSNk
ZWZpbmUgRkFOX1JFUE9SVF9GSUQJCTB4MDAwMDAyMDAKPiA+ID4gLSNlbmRpZgo+ID4gPiAgCj4g
PiA+ICAjaWZuZGVmIEZBTl9NQVJLX0lOT0RFCj4gPiA+ICAjZGVmaW5lIEZBTl9NQVJLX0lOT0RF
CQkwCj4gPiA+IEBAIC04OSw2ICs5MSw1MCBAQCBzdHJ1Y3QgZmFub3RpZnlfbWFya190eXBlIHsK
PiA+ID4gIAljb25zdCBjaGFyICogbmFtZTsKPiA+ID4gIH07Cj4gPiA+ICAKPiA+ID4gKyNpZm5k
ZWYgRkFOX1JFUE9SVF9GSUQKPiA+ID4gKyNkZWZpbmUgRkFOX1JFUE9SVF9GSUQJCTB4MDAwMDAy
MDAKPiA+ID4gKwo+ID4gPiArc3RydWN0IGZhbm90aWZ5X2V2ZW50X2luZm9faGVhZGVyIHsKPiA+
ID4gKwl1aW50OF90IGluZm9fdHlwZTsKPiA+ID4gKwl1aW50OF90IHBhZDsKPiA+ID4gKwl1aW50
MTZfdCBsZW47Cj4gPiA+ICt9Owo+ID4gPiArCj4gPiA+ICtzdHJ1Y3QgZmFub3RpZnlfZXZlbnRf
aW5mb19maWQgewo+ID4gPiArCXN0cnVjdCBmYW5vdGlmeV9ldmVudF9pbmZvX2hlYWRlciBoZHI7
Cj4gPiA+ICsJX19rZXJuZWxfZnNpZF90IGZzaWQ7Cj4gPiA+ICsJdW5zaWduZWQgY2hhciBoYW5k
bGVbMF07Cj4gPiA+ICt9Owo+ID4gPiArCj4gPiA+ICsvKgo+ID4gPiArICogSGVscGVyIGZ1bmN0
aW9uIHVzZWQgdG8gb2J0YWluIF9fa2VybmVsX2ZzaWRfdCBhbmQgZmlsZV9oYW5kbGUgb2JqZWN0
cwo+ID4gPiArICogZm9yIGEgZ2l2ZW4gcGF0aC4gVXNlZCBieSB0ZXN0IGZpbGVzIGNvcnJlbGF0
ZWQgdG8gRkFOX1JFUE9SVF9GSUQKPiA+ID4gKyAqIGZ1bmN0aW9uYWxpdHkuCj4gPiA+ICsgKi8K
PiA+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBmYW5vdGlmeV9nZXRfZmlkKGNvbnN0IGNoYXIgKnBh
dGgsIF9fa2VybmVsX2ZzaWRfdCAqZnNpZCwKPiA+ID4gKwkJCXN0cnVjdCBmaWxlX2hhbmRsZSAq
aGFuZGxlKQo+ID4gPiArewo+ID4gPiArCWludCBtb3VudF9pZDsKPiA+ID4gKwlzdHJ1Y3Qgc3Rh
dGZzIHN0YXRzOwo+ID4gPiArCj4gPiA+ICsJaWYgKHN0YXRmcyhwYXRoLCAmc3RhdHMpID09IC0x
KQo+ID4gPiArCQl0c3RfYnJrKFRCUk9LIHwgVEVSUk5PLAo+ID4gPiArCQkJInN0YXRmcyglcywg
Li4uKSBmYWlsZWQiLCBwYXRoKTsKPiA+ID4gKwltZW1jcHkoZnNpZCwgJnN0YXRzLmZfZnNpZCwg
c2l6ZW9mKHN0YXRzLmZfZnNpZCkpOwo+ID4gPiArCj4gPiA+ICsJaWYgKG5hbWVfdG9faGFuZGxl
X2F0KEFUX0ZEQ1dELCBwYXRoLCBoYW5kbGUsICZtb3VudF9pZCwgMCkgPT0gLTEpIHsKPiA+ID4g
KwkJaWYgKGVycm5vID09IEVPUE5PVFNVUFApIHsKPiA+ID4gKwkJCXRzdF9yZXMoVENPTkYsCj4g
PiA+ICsJCQkJImZpbGVzeXN0ZW0gJXMgZG9lcyBub3Qgc3VwcG9ydCBmaWxlIGhhbmRsZXMiLAo+
ID4gPiArCQkJCXRzdF9kZXZpY2UtPmZzX3R5cGUpOwo+ID4gCj4gPiBCdHcsIGhlcmUgdGhlIHRz
dF9yZXMoKSBkb2VzIG5vdCBtYWtlIG11Y2ggc2Vuc2Ugc2ljZSB0aGUgY29kZSB3aWxsCj4gPiBj
b250aW51ZSBhbmQgd2Ugd2lsbCBleGl0IHRoZSB0ZXN0IHdpdGggdGhlIHRzdF9icmsoKSBiZWxv
dy4gU2hvdWxkbid0Cj4gPiB3ZSB1c2UgdHN0X2JyaygpIGhlcmUgYXMgd2VsbD8KPiAKPiBZZXMs
IHdlIHNob3VsZCBiZSB1c2luZyB0c3RfYnJrKC4uLikgaW5zdGVhZC4gVGhhbmtzIGZvciBwaWNr
aW5nIHRoaXMgdXAuCj4gIAo+ID4gPiArCQl9Cj4gPiA+ICsJCXRzdF9icmsoVEJST0sgfCBURVJS
Tk8sCj4gPiA+ICsJCQkibmFtZV90b19oYW5kbGVfYXQoQVRfRkRDV0QsICVzLCAuLi4pIGZhaWxl
ZCIsIHBhdGgpOwo+ID4gPiArCX0KPiA+ID4gK30KPiA+ID4gKwo+ID4gPiArI2VuZGlmCj4gPiA+
ICsKPiA+ID4gICNkZWZpbmUgSU5JVF9GQU5PVElGWV9NQVJLX1RZUEUodCkgXAo+ID4gPiAgCXsg
RkFOX01BUktfICMjIHQsICJGQU5fTUFSS18iICN0IH0KCi0tIApNYXR0aGV3IEJvYnJvd3NraQoK
LS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo=
