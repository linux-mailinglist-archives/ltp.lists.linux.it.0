Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F511CF731
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 16:32:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E5503C25D4
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 16:32:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C40DE3C244E
 for <ltp@lists.linux.it>; Tue, 12 May 2020 16:32:37 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 0535C1A01145
 for <ltp@lists.linux.it>; Tue, 12 May 2020 16:32:28 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,383,1583164800"; d="scan'208";a="91954216"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 May 2020 22:32:25 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 60E0B50A996E;
 Tue, 12 May 2020 22:32:24 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 May 2020 22:32:25 +0800
Message-ID: <5EBAB376.4030804@cn.fujitsu.com>
Date: Tue, 12 May 2020 22:32:22 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Xiao Yang <ice_yangxiao@163.com>, Cyril Hrubis <chrubis@suse.cz>
References: <20200430085742.1663-1-yangx.jy@cn.fujitsu.com>
 <20200430085742.1663-2-yangx.jy@cn.fujitsu.com>
 <20200504051107.edvfiqloegt3ak5o@vireshk-i7>
 <b74eac89-11fc-9a7c-c337-ffe6f19ec7b8@163.com>
 <20200505033507.oerhoby6aif3leea@vireshk-i7>
 <c63909b8-a666-bf56-c747-78eff8c138b3@163.com>
In-Reply-To: <c63909b8-a666-bf56-c747-78eff8c138b3@163.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 60E0B50A996E.ABFC2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/pidfd_open*.c: Drop .min_kver flag
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMjAyMC81LzUgMTc6MzAsIFhpYW8gWWFuZyB3cm90ZToKPj4+Pj4gICAgICAgIFRTVF9DSEVD
S1BPSU5UX1dBS0UoMCk7Cj4+Pj4+IEBAIC00OSw4ICs0NywxNCBAQCBzdGF0aWMgdm9pZCBydW4o
dm9pZCkKPj4+Pj4gICAgICAgICAgICB0c3RfcmVzKFRQQVNTLCAicGlkZmRfb3BlbigpIHBhc3Nl
ZCIpOwo+Pj4+PiAgICB9Cj4+Pj4+ICtzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQo+Pj4+PiArewo+
Pj4+PiArICAgIC8vIENoZWNrIGlmIHBpZGZkX29wZW4oMikgaXMgbm90IHN1cHBvcnRlZAo+Pj4+
PiArICAgIHRzdF9zeXNjYWxsKF9fTlJfcGlkZmRfb3BlbiwgLTEsIDApOwo+Pj4+PiArfQo+Pj4+
PiArCj4+Pj4+ICAgIHN0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKPj4+Pj4gLSAgICAu
bWluX2t2ZXIgPSAiNS4zIiwKPj4+Pj4gKyAgICAuc2V0dXAgPSBzZXR1cCwKPj4+Pj4gICAgICAg
IC50ZXN0X2FsbCA9IHJ1biwKPj4+Pj4gICAgICAgIC5mb3Jrc19jaGlsZCA9IDEsCj4+Pj4+ICAg
ICAgICAubmVlZHNfY2hlY2twb2ludHMgPSAxLAo+Pj4+IFBsZWFzZSBoYXZlIGEgbG9vayBhdCBm
c29wZW5fc3VwcG9ydGVkX2J5X2tlcm5lbCgpIGluIGxhcGkvZnNtb3VudC5oCj4+Pj4gYW5kIG1h
a2Ugc3VjaCBhIGhlbHBlci4KPj4+IEZpcnN0LCBJIHdhbnQgdG8gZXhwbGFpbiBteSBjaGVjayBw
b2ludDoKPj4+Cj4+PiBQYXNzaW5nIGludmFsaWQgYXJndW1lbnQgY2FuIGNoZWNrIHRoZSBzdXBw
b3J0IG9mIHBpZGZkX29wZW4oMikgYnkKPj4+IEVOT1NZUwo+Pj4gZXJybm8gYW5kIHdlIGRvbid0
IG5lZWQgdG8gY2xvc2UgdGhlIHBpZGZkLgo+Pj4KPj4+IFNlY29uZCwgSSBkb24ndCBsaWtlIHRo
ZSBpbXBsZW1lbnRhdGlvbiBvZgo+Pj4gZnNvcGVuX3N1cHBvcnRlZF9ieV9rZXJuZWwoKSBhbmQK
Pj4+IGdpdmUgc29tZSBzdWdnZXN0aW9uczoKPj4+Cj4+PiBhKSBzeXNjYWxsKCkvdHN0X3N5c2Nh
bGwoKSBpcyBlbm91Z2ggdG8gY2hlY2sgdGhlIHN1cHBvcnQgb2YKPj4+IHBpZGZkX29wZW4oMikK
Pj4+IGFuZCAndHN0X2t2ZXJjbXAoNSwgMiwgMCkpIDwgMCcgd2lsbCBza2lwIHRoZSBjaGVjawo+
Pj4KPj4+ICAgICAgaWYgYSBrZXJuZWwgb24gZGlzdHJpYnV0aW9uIGlzIG5ld2VyIHRoYW4gdjUu
MiBidXQgZHJvcCB0aGUKPj4+IHN1cHBvcnQgb2YKPj4+IHBpZGZkX29wZW4oMikgb24gcHVycG9z
ZS4KPj4gSSBkb24ndCB0aGluayBrZXJuZWwgY2FuIGRyb3Agc3VwcG9ydCBvZiBzeXNjYWxscyBq
dXN0IGxpa2UgdGhhdCwgd2UKPj4gY2FuJ3QgYnJlYWsgdXNlciBzcGFjZS4gQW5kIGlmIHRoYXQg
aXMgZG9uZSwgd2UgbmVlZCB0byBmaXggdXNlcnNwYWNlCj4+IGFnYWluIHNlcGFyYXRlbHkgZm9y
IHRoYXQuCj4KPiBIaSBWaXJlc2gsCj4KPiBJdCBpcyBqdXN0IGEgcG9zc2libGUgc2l0dWF0aW9u
77yMIGZvciBleGFtcGxlOgo+Cj4gVXBzdHJlYW0ga2VybmVsIGludHJvZHVjZXMgYnRyZnMgZmls
ZXN5c3RlbSBsb25nIGxvbmcgYWdvIGJ1dCB0aGUga2VybmVsCj4KPiBvZiBSSEVMOCBkcm9wcyBi
dHJmcyBmaWxlc3lzdGVtIGJlY2F1c2Ugb2Ygc29tZSByZWFzb25zLgo+Cj4+Cj4+IFdlIGNhbWUg
dG8gdGhlIGltcGxlbWVudGF0aW9uIG9mIGZzb3Blbl9zdXBwb3J0ZWRfYnlfa2VybmVsKCkgYWZ0
ZXIgYQo+PiBsb3Qgb2YgcmV2aWV3cyBhbmQgZGVjaWRlZCBvbiB0aGF0IGFuZCBzbyBJIGFza2Vk
IHlvdSBmb3IgdGhlIHNha2Ugb2YKPj4ga2VlcGluZyBzaW1pbGFyIGNvZGUgdGhyb3VnaG91dCBM
VFAgKG9mIGNvdXJzZSB0aGVyZSB3aWxsIGJlIG9sZAo+PiB1c2FnZXMgd2hpY2ggYXJlIGRpZmZl
cmVudCkgdG8gaGF2ZSBhIHNpbWlsYXIgaW1wbGVtZW50YXRpb24uCj4+Cj4+IEFueXdheSwgSSB3
aWxsIGxlYXZlIGl0IHRvIEN5cmlsIHRvIGRlY2lkZSBvbiB0aGF0IDopCj4KPiBIaSBDeXJpbCwK
Pgo+IERvIHlvdSBoYXZlIGFueSBjb21tZW50IG9uIHRoZSBpbXBsZW1lbnRhdGlvbiBvZgo+IGZz
b3Blbl9zdXBwb3J0ZWRfYnlfa2VybmVsKCkgYW5kCj4KPiBteSBjaGVjayBwb2ludChpLmUuIGNo
ZWNrIHRoZSBzdXBwb3J0IG9mIHBpZGZkX29wZW4oMikgYnkgcGFzc2luZwo+IGludmFsaWQgYXJn
dW1lbnQgKS4KSGkgQ3lyaWwsCgpEbyB5b3UgaGF2ZSBjb21tZW50IG9uIHRoZSBzdXBwb3J0IGNo
ZWNrIG9mIApwaWRmZF9vcGVuKCkvZnNvcGVuX3N1cHBvcnRlZF9ieV9rZXJuZWwoKT8KClRoYW5r
IHlvdSBpbiBhZHZhbmNlLgoKQmVzdCBSZWdhcmRzLApYaWFvIFlhbmcKCgoKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
