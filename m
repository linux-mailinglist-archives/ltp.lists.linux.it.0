Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D83DA1C51F3
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:31:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 80BCB3C57E7
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:31:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D19883C267E
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:31:11 +0200 (CEST)
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 28DD160082B
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:30:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=Z7Kvh
 Ml7vWkcmHYZGGE3n23E52Fi2Iy/I2jhj4tMTqE=; b=OYRSTB07ZL2g7GB2dzifk
 EtOBYQgPiOhW75PA1QrcCPwsZ0xM9abNhDE1PF+fgSsC6AK5QZYqTyH4hZ5Y5B8z
 5nl1CrJIha35hGC2tXkT+7AaoA11wJWNKODAV6CT6zuHwLqMXEgQXf/zrn0GRacd
 yxq/0T1shq9y48QFfpvzEk=
Received: from [192.168.0.10] (unknown [223.64.143.32])
 by smtp9 (Coremail) with SMTP id DcCowAB3rC1CMrFebcRLAg--.739S2;
 Tue, 05 May 2020 17:30:42 +0800 (CST)
To: Viresh Kumar <viresh.kumar@linaro.org>, Cyril Hrubis <chrubis@suse.cz>
References: <20200430085742.1663-1-yangx.jy@cn.fujitsu.com>
 <20200430085742.1663-2-yangx.jy@cn.fujitsu.com>
 <20200504051107.edvfiqloegt3ak5o@vireshk-i7>
 <b74eac89-11fc-9a7c-c337-ffe6f19ec7b8@163.com>
 <20200505033507.oerhoby6aif3leea@vireshk-i7>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <c63909b8-a666-bf56-c747-78eff8c138b3@163.com>
Date: Tue, 5 May 2020 17:30:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200505033507.oerhoby6aif3leea@vireshk-i7>
Content-Language: en-US
X-CM-TRANSID: DcCowAB3rC1CMrFebcRLAg--.739S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFW7XF4xXw43Gw4kGw4rZrb_yoW5XF43pa
 yY9a12yrZ7Jr97Aws2vw129w1IyrykA345J3Z8Jry5J3s0qas3Gr1rWa45u34rJrWfC3W2
 qw4Utr9xGw13CFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jLWrJUUUUU=
X-Originating-IP: [223.64.143.32]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbB0gIbXlUMV4vOHgABsB
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Q2M6IEN5cmlsCgpPbiA1LzUvMjAgMTE6MzUgQU0sIFZpcmVzaCBLdW1hciB3cm90ZToKPiBPbiAw
NC0wNS0yMCwgMjA6NDksIFhpYW8gWWFuZyB3cm90ZToKPj4gWWVzLCBJdCBpcyB1bnJlbGF0ZWQg
Y2hhbmdlIGFuZCBqdXN0IGEgc21hbGwgY2xlYW51cC4KPj4KPj4gTXkgY29tbWl0IG1lc3NhZ2Ug
aGFzIG1lbnRpb25lZCBpdCBhbmQgSSBkb24ndCB3YW50IHRvIGRvIHRoZSBjbGVhbnVwIGluCj4+
IHNlcGVyYXRlIHBhdGNoLgo+IFJlbW92aW5nIHVzYWdlIG9mIFRFU1QoKSBpcyBub3QgY2xlYW51
cCBidXQganVzdCBhIGNob2ljZSBvZiB0aGUKPiBkZXZlbG9wZXIgb2YgaG93IHRvIHdyaXRlIGNv
ZGUsIGl0IHdhc24ndCBteSBjaG9pY2UgYW5kIEkgaGF2ZSBiZWVuCj4gYXNrZWQgdG8gZG8gaXQg
YnkgbWFpbnRhaW5lcnMsIHNvIHJlbW92aW5nIGl0IGxpa2UgdGhhdCBpc24ndCBjb3JyZWN0Lgo+
IElmIHlvdSB3YW50IHRvIGRvIGl0LCBwbGVhc2Ugc2VuZCBhIHNlcGFyYXRlIHBhdGNoIGFuZCBk
b24ndCBtaXggd2l0aAo+IHVucmVsYXRlZCBjaGFuZ2VzLiBUaGVyZSBzaG91bGQgYmUgYSBzZXBh
cmF0ZSBwYXRjaCBub3JtYWxseSBmb3IKPiBkaWZmZXJlbnQgY2hhbmdlcy4KCkhpIFZpcmVzaO+8
jAoKSSB0aGluayBURVNUKCkgaXMgc3VycGx1cyBiZWNhdXNlIGZkIGFuZCBURVJSTk8gaXMgZW5v
dWdoIHRvIGZpbmlzaCAKY2hlY2sgcG9pbnQuCgpJdCBpcyBub3QgYW4gaW1wb3J0YW50IGNoYW5n
ZSBhbmQgSSB3aWxsIGtlZXAgaXQgaWYgeW91IGFuZCBDeXJpbCBwcmVmZXIgCnRvIHVzZSBURVNU
KCkuCgo+Cj4+Pj4gICAgCVRTVF9DSEVDS1BPSU5UX1dBS0UoMCk7Cj4+Pj4gQEAgLTQ5LDggKzQ3
LDE0IEBAIHN0YXRpYyB2b2lkIHJ1bih2b2lkKQo+Pj4+ICAgIAkJdHN0X3JlcyhUUEFTUywgInBp
ZGZkX29wZW4oKSBwYXNzZWQiKTsKPj4+PiAgICB9Cj4+Pj4gK3N0YXRpYyB2b2lkIHNldHVwKHZv
aWQpCj4+Pj4gK3sKPj4+PiArCS8vIENoZWNrIGlmIHBpZGZkX29wZW4oMikgaXMgbm90IHN1cHBv
cnRlZAo+Pj4+ICsJdHN0X3N5c2NhbGwoX19OUl9waWRmZF9vcGVuLCAtMSwgMCk7Cj4+Pj4gK30K
Pj4+PiArCj4+Pj4gICAgc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0gewo+Pj4+IC0JLm1p
bl9rdmVyID0gIjUuMyIsCj4+Pj4gKwkuc2V0dXAgPSBzZXR1cCwKPj4+PiAgICAJLnRlc3RfYWxs
ID0gcnVuLAo+Pj4+ICAgIAkuZm9ya3NfY2hpbGQgPSAxLAo+Pj4+ICAgIAkubmVlZHNfY2hlY2tw
b2ludHMgPSAxLAo+Pj4gUGxlYXNlIGhhdmUgYSBsb29rIGF0IGZzb3Blbl9zdXBwb3J0ZWRfYnlf
a2VybmVsKCkgaW4gbGFwaS9mc21vdW50LmgKPj4+IGFuZCBtYWtlIHN1Y2ggYSBoZWxwZXIuCj4+
IEZpcnN0LCBJIHdhbnQgdG8gZXhwbGFpbiBteSBjaGVjayBwb2ludDoKPj4KPj4gUGFzc2luZyBp
bnZhbGlkIGFyZ3VtZW50IGNhbiBjaGVjayB0aGUgc3VwcG9ydCBvZiBwaWRmZF9vcGVuKDIpIGJ5
IEVOT1NZUwo+PiBlcnJubyBhbmQgd2UgZG9uJ3QgbmVlZCB0byBjbG9zZSB0aGUgcGlkZmQuCj4+
Cj4+IFNlY29uZCwgSSBkb24ndCBsaWtlIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBmc29wZW5fc3Vw
cG9ydGVkX2J5X2tlcm5lbCgpIGFuZAo+PiBnaXZlIHNvbWUgc3VnZ2VzdGlvbnM6Cj4+Cj4+IGEp
IHN5c2NhbGwoKS90c3Rfc3lzY2FsbCgpIGlzIGVub3VnaCB0byBjaGVjayB0aGUgc3VwcG9ydCBv
ZiBwaWRmZF9vcGVuKDIpCj4+IGFuZCAndHN0X2t2ZXJjbXAoNSwgMiwgMCkpIDwgMCcgd2lsbCBz
a2lwIHRoZSBjaGVjawo+Pgo+PiAgwqDCoMKgIGlmIGEga2VybmVsIG9uIGRpc3RyaWJ1dGlvbiBp
cyBuZXdlciB0aGFuIHY1LjIgYnV0IGRyb3AgdGhlIHN1cHBvcnQgb2YKPj4gcGlkZmRfb3Blbigy
KSBvbiBwdXJwb3NlLgo+IEkgZG9uJ3QgdGhpbmsga2VybmVsIGNhbiBkcm9wIHN1cHBvcnQgb2Yg
c3lzY2FsbHMganVzdCBsaWtlIHRoYXQsIHdlCj4gY2FuJ3QgYnJlYWsgdXNlciBzcGFjZS4gQW5k
IGlmIHRoYXQgaXMgZG9uZSwgd2UgbmVlZCB0byBmaXggdXNlcnNwYWNlCj4gYWdhaW4gc2VwYXJh
dGVseSBmb3IgdGhhdC4KCkhpIFZpcmVzaCwKCkl0IGlzIGp1c3QgYSBwb3NzaWJsZSBzaXR1YXRp
b27vvIwgZm9yIGV4YW1wbGU6CgpVcHN0cmVhbSBrZXJuZWwgaW50cm9kdWNlcyBidHJmcyBmaWxl
c3lzdGVtIGxvbmcgbG9uZyBhZ28gYnV0IHRoZSBrZXJuZWwKCm9mIFJIRUw4IGRyb3BzIGJ0cmZz
IGZpbGVzeXN0ZW0gYmVjYXVzZSBvZiBzb21lIHJlYXNvbnMuCgo+Cj4gV2UgY2FtZSB0byB0aGUg
aW1wbGVtZW50YXRpb24gb2YgZnNvcGVuX3N1cHBvcnRlZF9ieV9rZXJuZWwoKSBhZnRlciBhCj4g
bG90IG9mIHJldmlld3MgYW5kIGRlY2lkZWQgb24gdGhhdCBhbmQgc28gSSBhc2tlZCB5b3UgZm9y
IHRoZSBzYWtlIG9mCj4ga2VlcGluZyBzaW1pbGFyIGNvZGUgdGhyb3VnaG91dCBMVFAgKG9mIGNv
dXJzZSB0aGVyZSB3aWxsIGJlIG9sZAo+IHVzYWdlcyB3aGljaCBhcmUgZGlmZmVyZW50KSB0byBo
YXZlIGEgc2ltaWxhciBpbXBsZW1lbnRhdGlvbi4KPgo+IEFueXdheSwgSSB3aWxsIGxlYXZlIGl0
IHRvIEN5cmlsIHRvIGRlY2lkZSBvbiB0aGF0IDopCgpIaSBDeXJpbCwKCkRvIHlvdSBoYXZlIGFu
eSBjb21tZW50IG9uIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiAKZnNvcGVuX3N1cHBvcnRlZF9ieV9r
ZXJuZWwoKSBhbmQKCm15IGNoZWNrIHBvaW50KGkuZS4gY2hlY2sgdGhlIHN1cHBvcnQgb2YgcGlk
ZmRfb3BlbigyKSBieSBwYXNzaW5nIAppbnZhbGlkIGFyZ3VtZW50ICkuCgpUaGFua3MsCgpYaWFv
IFlhbmcKCj4KCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQv
bGlzdGluZm8vbHRwCg==
