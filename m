Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D371C4CA9
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 05:28:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1C563C5859
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 05:28:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 69A333C265D
 for <ltp@lists.linux.it>; Tue,  5 May 2020 05:28:08 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 35FC910005B5
 for <ltp@lists.linux.it>; Tue,  5 May 2020 05:28:08 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id fu13so400425pjb.5
 for <ltp@lists.linux.it>; Mon, 04 May 2020 20:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=H1xRtLKqUy5id5upiWqxpmx1XJCyqM0f31b95dFMrKI=;
 b=yB6pL9nTooaFctPFPl0k1QUyeIGxjyf9xnfTfV/Yz0HJcWIv6VmPuCypG/wf9e4GyA
 CP6hQjfEWtIjs7JprXdFczPEAgC5x6ZGIeGCIzQ7UPrXU2Txyhm+eAVAmAJS0MiJyLTR
 7NK192U1syQXg/b0DGIz9F9WtaQjwbB7/wLpVkpng+JhB7R1dEUfgaIiJMoG5Tz798w3
 yYYw7M7sizVYrsQ0OuUDEnymo7VvSMNxDeIuGX+Szn5uYgePeIl4fuccrjag4wFGt0OE
 jEbOOycvY1s49HIoGQPHaIU8HVoGynlfjD8Sv5wQ/auT5G5LMsHJoLajigsPLxNo4gLc
 9yYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=H1xRtLKqUy5id5upiWqxpmx1XJCyqM0f31b95dFMrKI=;
 b=AE0quK5vkPD6k9OhoDfLZnpxSIV/Rjqwiv23eWxU7wvvvZRDPIlCkIFmz9D5fKp/5J
 1OmStX4Pg5rV3le3AYM9lgyk5TqaCwNoJnk913lb2apxwDWUT90J2sD6Exfi5rEtQQe5
 CDkjAuBI+M6bX6436HSxFA8u31eJ8QGimIg4TIHZzz11VmwilVwVgbAlvVdd/WFePj3V
 WgWC7YVukQ8/WvjKwAlrxpnHowfjXruz9kQWcIhQUUfshF+o1q7kiqPwlDUvFg2FJzbq
 0ngOK8LUoOTGY5CMlRPtNT8PCJoonZiBjG1iada5LXzsZsQdhH5rKi8/46fIHzJnyTWH
 BFtg==
X-Gm-Message-State: AGi0PubAdAxh+sQCJiEXxjKzLXBstMUCRwt/H+4wN4bG5eRW4PmPEkwY
 T2I+AmHex9V+loy9AgxRunMaxA==
X-Google-Smtp-Source: APiQypIS4wCjaXfztQnQWPRQNzRi+H5jrJTwI5fJUCWzn62HIiFcnHmaOABjAjlegIe5l/Rr69crAg==
X-Received: by 2002:a17:90a:35f0:: with SMTP id
 r103mr324632pjb.167.1588649286467; 
 Mon, 04 May 2020 20:28:06 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id a23sm506302pfo.145.2020.05.04.20.28.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 May 2020 20:28:05 -0700 (PDT)
Date: Tue, 5 May 2020 08:58:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <20200505032803.s6axol3sfyyzl6ag@vireshk-i7>
References: <20200430085742.1663-1-yangx.jy@cn.fujitsu.com>
 <20200504050937.oassdcfg4x5zh4nm@vireshk-i7>
 <e666a91d-1ffd-0f5f-131e-966ff763b14e@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e666a91d-1ffd-0f5f-131e-966ff763b14e@163.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/pidfd_open01.c: Add check for
 close-on-exec flag
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

T24gMDQtMDUtMjAsIDE5OjMxLCBYaWFvIFlhbmcgd3JvdGU6Cj4gT24gNS80LzIwIDE6MDkgUE0s
IFZpcmVzaCBLdW1hciB3cm90ZToKPiA+IE9uIDMwLTA0LTIwLCAxNjo1NywgWGlhbyBZYW5nIHdy
b3RlOgo+ID4gPiBwaWRmZF9vcGVuKDIpIHdpbGwgc2V0IGNsb3NlLW9uLWV4ZWMgZmxhZyBvbiB0
aGUgZmlsZSBkZXNjcmlwdG9yIGFzIGl0Cj4gPiA+IG1hbnBhZ2Ugc3RhdGVzLCBzbyBjaGVjayBj
bG9zZS1vbi1leGVjIGZsYWcgYnkgZmNudGwoMikuCj4gPiA+IAo+ID4gPiBBbHNvIGF2b2lkIGNv
bXBpbGVyIHdhcm5pbmcgYnkgcmVwbGFjaW5nIChsb25nKSBUU1RfUkVUIHdpdGggKGludCkgcGlk
ZmQ6Cj4gPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ID4gPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gcGlkZmRfb3BlbjAxLmM6OToKPiA+
ID4gcGlkZmRfb3BlbjAxLmM6IEluIGZ1bmN0aW9uIOKAmHJ1buKAmToKPiA+ID4gLi4vLi4vLi4v
Li4vaW5jbHVkZS90c3RfdGVzdC5oOjc2OjQxOiB3YXJuaW5nOiBmb3JtYXQg4oCYJWnigJkgZXhw
ZWN0cyBhcmd1bWVudCBvZiB0eXBlIOKAmGludOKAmSwgYnV0IGFyZ3VtZW50IDUgaGFzIHR5cGUg
4oCYbG9uZyBpbnTigJkgWy1XZm9ybWF0PV0KPiA+ID4gICAgIDc2IHwgICB0c3RfYnJrXyhfX0ZJ
TEVfXywgX19MSU5FX18sICh0dHlwZSksIChhcmdfZm10KSwgIyNfX1ZBX0FSR1NfXyk7XAo+ID4g
PiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+
fn5+Cj4gPiA+IC4uLy4uLy4uLy4uL2luY2x1ZGUvdHN0X3NhZmVfbWFjcm9zLmg6MjI0OjU6IG5v
dGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJh0c3RfYnJr4oCZCj4gPiA+ICAgIDIyNCB8ICAg
ICB0c3RfYnJrKFRCUk9LIHwgVEVSUk5PLCAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4g
PiAgICAgICAgfCAgICAgXn5+fn5+fgo+ID4gPiBwaWRmZF9vcGVuMDEuYzoyMDo5OiBub3RlOiBp
biBleHBhbnNpb24gb2YgbWFjcm8g4oCYU0FGRV9GQ05UTOKAmQo+ID4gPiAgICAgMjAgfCAgZmxh
ZyA9IFNBRkVfRkNOVEwoVFNUX1JFVCwgRl9HRVRGRCk7Cj4gPiBUaGlzIGxvZyBpc24ndCB1c2Vm
dWwgYXMgdGhlIHdhcm5pbmcgc3RhcnRlZCBjb21pbmcgYWZ0ZXIgeW91ciBjaGFuZ2UKPiA+IG9u
bHkgYW5kIG5vdCBiZWZvcmUuCj4gCj4gSGkgVmlyZXNoLAo+IAo+IFRoYW5rcyBmb3IgeW91ciBy
ZXZpZXcuCj4gCj4gUmlnaHTvvIxqdXN0IGFkZCBhIGhpbnQgd2h5IEkgdXNlIHBpZGZkIGluc3Rl
YWQgc28gSSB3YW50IHRvIGtlZXAgaXQuCj4gCj4gT2YgY291cnNl77yMSSB3aWxsIG1lbnRpb24g
dGhhdCBteSBjaGFuZ2UgaW50cm9kdWNlcyB0aGUgY29tcGlsZXIgd2FybmluZyBpbgo+IHYyIHBh
dGNoLgoKRXZlbiB0aGF0IGlzbid0IHJlcXVpcmVkIHJlYWxseS4gWW91IGNhbiBhZGQgYSB2YXJp
YWJsZSBpZiB5b3UgbGlrZS4KCj4gPiAKPiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBY
aWFvIFlhbmcgPHlhbmd4Lmp5QGNuLmZ1aml0c3UuY29tPgo+ID4gPiAtLS0KPiA+ID4gICAuLi4v
a2VybmVsL3N5c2NhbGxzL3BpZGZkX29wZW4vcGlkZmRfb3BlbjAxLmMgIHwgMTggKysrKysrKysr
KysrKystLS0tCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9waWRmZF9vcGVuL3BpZGZkX29wZW4wMS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9waWRmZF9vcGVuL3BpZGZkX29wZW4wMS5jCj4gPiA+IGluZGV4IDkzYmI4NjY4Ny4uMjkzZTkz
YjYzIDEwMDY0NAo+ID4gPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpZGZkX29w
ZW4vcGlkZmRfb3BlbjAxLmMKPiA+ID4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9w
aWRmZF9vcGVuL3BpZGZkX29wZW4wMS5jCj4gPiA+IEBAIC02LDE3ICs2LDI3IEBACj4gPiA+ICAg
ICogQmFzaWMgcGlkZmRfb3BlbigpIHRlc3QsIGZldGNoZXMgdGhlIFBJRCBvZiB0aGUgY3VycmVu
dCBwcm9jZXNzIGFuZCB0cmllcyB0bwo+ID4gPiAgICAqIGdldCBpdHMgZmlsZSBkZXNjcmlwdG9y
Lgo+ID4gPiAgICAqLwo+ID4gPiArCj4gPiA+ICsjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Cj4gPiA+
ICsjaW5jbHVkZSA8dW5pc3RkLmg+Cj4gPiA+ICsjaW5jbHVkZSA8ZmNudGwuaD4KPiA+ID4gICAj
aW5jbHVkZSAidHN0X3Rlc3QuaCIKPiA+ID4gICAjaW5jbHVkZSAibGFwaS9waWRmZF9vcGVuLmgi
Cj4gPiA+ICAgc3RhdGljIHZvaWQgcnVuKHZvaWQpCj4gPiA+ICAgewo+ID4gPiAtCVRFU1QocGlk
ZmRfb3BlbihnZXRwaWQoKSwgMCkpOwo+ID4gPiArCWludCBwaWRmZCA9IDAsIGZsYWcgPSAwOwo+
ID4gTm9uZSBvZiB0aGVzZSBuZWVkIHRvIGJlIGluaXRpYWxpemVkLgo+IAo+IEluaXRpYWxpemF0
aW9uIG9yIG5vdCBpbml0aWFsaXphdGlvbiBhcmUgYm90aCBmaW5lIGZvciBtZS4KPgo+IERvIHlv
dSBoYXZlIGFueSBzdHJvbmcgcmVhc29uIHRvIGRyb3AgSW5pdGlhbGl6YXRpb24/CgpJbml0aWFs
aXphdGlvbnMgYXJlIG9ubHkgcmVxdWlyZWQgaWYgdGhlcmUgaXMgYSBjaGFuY2Ugb2YgdGhlIHZh
cmlhYmxlCmdldHRpbmcgdXNlZCB3aXRob3V0IGJlaW5nIGluaXRpYWxpemVkLCB3aGljaCBpc24n
dCB0aGUgY2FzZSBoZXJlLgpXaGF0ZXZlciB2YWx1ZSB5b3Ugc2V0IHRvIHRoZXNlIHZhcmlhYmxl
cywgdGhleSB3aWxsIGdldCBvdmVyd3JpdHRlbgphbnl3YXkuCgo+ID4gCj4gPiA+ICsKPiA+ID4g
KwlwaWRmZCA9IHBpZGZkX29wZW4oZ2V0cGlkKCksIDApOwo+ID4gPiArCWlmIChwaWRmZCA9PSAt
MSkKPiA+ID4gKwkJdHN0X2JyayhURkFJTCB8IFRFUlJOTywgInBpZGZkX29wZW4oZ2V0cGlkKCks
IDApIGZhaWxlZCIpOwo+ID4gVGhpcyBjb3VsZCBoYXZlIGJlZW4gd3JpdHRlbiBhczoKPiA+ICAg
ICAgICAgIFRFU1QocGlkZmQgPSBwaWRmZF9vcGVuKGdldHBpZCgpLCAwKSk7Cj4gCj4gV2h5IGRv
IHlvdSB3YW50IHRvIGtlZXAgVEVTVCgpPyBJIGRvbid0IHRoaW5rIGl0IGlzIG5lY2Vzc2FyeToK
PiAKPiAxKSBwaWRmZCBhbmQgVEVSUk5PIGFyZSBlbm91Z2ggdG8gY2hlY2sgcmV0dXJuIHZhbHVl
IGFuZCBlcnJuby4KPiAKPiAyKSBJdCBpcyBPSyBmb3IgdGVzdGNhc2UgdG8gbm90IHVzZSBURVNU
KCkuCgpBcyBmYXIgYXMgSSBoYXZlIHVuZGVyc3Rvb2QsIHRoYXQgaXMgdGhlIHByZWZlcnJlZCB3
YXkgb2YgZG9pbmcgaXQKZnJvbSBMVFAgbWFpbnRhaW5lcnMuCgpPdmVyIHRoYXQgaXQgd2FzIGFs
cmVhZHkgdGhlcmUsIHdoeSByZW1vdmUgaXQgbm93ID8gSnVzdCBmaXggdGhlCnByb2JsZW1zIHlv
dSBhcmUgdHJ5aW5nIHRvIGZpeCBhbmQgdGhhdCBzaG91bGQgYmUgZ29vZC4KCi0tIAp2aXJlc2gK
Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK
