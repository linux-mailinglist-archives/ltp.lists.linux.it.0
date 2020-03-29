Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 503C9196B73
	for <lists+linux-ltp@lfdr.de>; Sun, 29 Mar 2020 07:36:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 79E9C3C31F7
	for <lists+linux-ltp@lfdr.de>; Sun, 29 Mar 2020 07:36:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3C9E03C31C8
 for <ltp@lists.linux.it>; Sun, 29 Mar 2020 07:35:57 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 624F4200211
 for <ltp@lists.linux.it>; Sun, 29 Mar 2020 07:35:53 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,319,1580745600"; d="scan'208";a="87684613"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 29 Mar 2020 13:29:36 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id A2F1E406AB15;
 Sun, 29 Mar 2020 13:19:20 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 29 Mar 2020 13:29:34 +0800
Message-ID: <5E80323C.5070408@cn.fujitsu.com>
Date: Sun, 29 Mar 2020 13:29:32 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200327213924.18816-1-pvorel@suse.cz>
 <4ff84a77-b858-6cae-a320-cfaed3646864@163.com>
 <20200328034253.GA2720439@x230>
In-Reply-To: <20200328034253.GA2720439@x230>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: A2F1E406AB15.A9CE5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/6] C API: .needs_cmds and SAFE_RUN_CMD()
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

T24gMjAyMC8zLzI4IDExOjQyLCBQZXRyIFZvcmVsIHdyb3RlOgo+IEhpIFhpYW8sCj4KPj4gT24g
My8yOC8yMCA1OjM5IEFNLCBQZXRyIFZvcmVsIHdyb3RlOgo+Pj4gKyBUaGVyZSBpcyBhIGRvdWJs
ZSBjaGVjayAoZmlyc3QgaW4KPj4+IC5uZWVkc19jbWRzLCB0aGVuIGluIFNBRkVfUlVOX0NNRCgp
KSwgbWF5YmUgdGhhdCdzIG5vdCBuZWVkZWQuCj4KPj4gSGkgUGV0ciwKPgo+PiBXaHkgZG8geW91
IG5lZWQgdGhlIGR1cGxpY2F0ZSAubmVlZHNfY21kcyBmbGFnPyhpdCBpbnRyb2R1Y2VzIHRoZSBk
b3VibGUKPj4gY2hlY2sgYXMgeW91IHNhaWQpCj4KPj4gVXN1YWxseSwgYWxsIHRlc3RzIHJ1biBj
b21tYW5kcyBieSB0c3RfcnVuX2NtZCgpL1NBRkVfUlVOX0NNRCgpIGFuZCB0aGV5IGNhbgo+PiBy
ZXBvcnQgVENPTkYKPgo+PiBieSBwYXNzaW5nIFRTVF9SVU5fQ01EX0NIRUNLX0NNRCBzbyBpdCBp
cyBmYWlyIHRvIGJlIGEgcGFydCBvZgo+PiB0c3RfcnVuX2NtZCgpL1NBRkVfUlVOX0NNRCgpLgo+
Cj4gVGhhbmtzIGZvciB5b3VyIHJldmlldy4KPiBJIGd1ZXNzIEN5cmlsIHdpbGwgcHJlZmVyIC5u
ZWVkc19jbWRzLCBhcyBpdCBjYW4gYmUgcGFyc2VkIC0gbWV0YWRhdGEgcHJvamVjdDoKPiBodHRw
czovL3Blb3BsZS5rZXJuZWwub3JnL21ldGFuL3Rvd2FyZHMtcGFyYWxsZWwta2VybmVsLXRlc3Qt
cnVucwo+IGh0dHBzOi8vZ2l0aHViLmNvbS9tZXRhbi11Y3cvbHRwL3RyZWUvbWFzdGVyL2RvY3Bh
cnNlCkhpIFBldHLvvIwKClRoYW5rIHlvdSBmb3Igc2hhcmluZyB0aGVzZSBpbmZvLgpEb2VzIEN5
cmlsIHdhbnQgdG8gZ2V0IG1ldGFkYXRhIGZyb20gc3RydWN0IHRzdF90ZXN0IGRpcmVjdGx5PwoK
SG93IGFib3V0IHRoZSByb3VnaCBkZXNpZ24/CjEpIC5uZWVkc19jbWRzIG9ubHkgc2F2ZXMgdGhl
IHJlcXVpcmVkIGNvbW1hbmRzLihkb2Vzbid0IGRvIGFueSBjaGVjaykKMikgcGFzcyB0aGUgY29y
cmVzcG9uZGluZyBtZW1iZXIgb2YgLm5lZWRzX2NtZHMgdG8gCnRzdF9ydW5fY21kKCkvU0FGRV9S
VU5fQ01EKCkoZG8gY2hlY2sgaW4gdGhlc2UgZnVuY3Rpb25zKS4KRm9yIGV4YW1wbGU6Ci0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIyBncmVwIHRzdF9uZWVk
c19jbWRzIGluY2x1ZGUvdHN0X2NtZC5oCmV4dGVybiBjb25zdCBjaGFyICpjb25zdCAqdHN0X25l
ZWRzX2NtZHM7CgojIGdyZXAgLUIxIHRzdF9uZWVkc19jbWRzIGxpYi90c3RfdGVzdC5jCgpjb25z
dCBjaGFyICpjb25zdCAqdHN0X25lZWRzX2NtZHM7Ci0tIAogICAgIGlmICh0c3RfdGVzdC0+bmVl
ZHNfY21kcykKICAgICAgICAgdHN0X25lZWRzX2NtZHMgPSB0c3RfdGVzdC0+bmVlZHNfY21kczsK
CiMgZ3JlcCAtQTIgJ25lZWRzX2NtZHMnIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvYWRkX2tl
eS9hZGRfa2V5MDUuYwogICAgIGNvbnN0IGNoYXIgKmNvbnN0IGNtZF91c2VyYWRkW10gPSB7dHN0
X25lZWRzX2NtZHNbMF0sIHVzZXJuYW1lLCBOVUxMfTsKICAgICBpbnQgcmM7CgotLSAKICAgICBj
b25zdCBjaGFyICpjb25zdCBjbWRfdXNlcmRlbFtdID0ge3RzdF9uZWVkc19jbWRzWzFdLCAiLXIi
LCAKdXNlcm5hbWUsIE5VTEx9OwoKICAgICBpZiAodHN0X3J1bl9jbWQoY21kX3VzZXJkZWwsIE5V
TEwsIE5VTEwsIDEpKQotLSAKICAgICAubmVlZHNfY21kcyA9IChjb25zdCBjaGFyICpjb25zdCBb
XSkgewogICAgICAgICAidXNlcmFkZCIsCiAgICAgICAgICJ1c2VyZGVsIiwKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpidHc6IGlzIGl0IHBvc3NpYmxlIGZv
ciAubmVlZHNfY21kcyB0byBzYXZlIHRoZSByZXF1aXJlZCBjb21tYW5kcyB3aXRoIApvcHRpb25z
PwoKVGhhbmtzLApYaWFvIFlhbmcKPgo+IEkgcHV0IGl0IHRoZXJlIGJlY2F1c2Ugc29tZSBjb21t
YW5kIG1pZ2h0IGJlIHJ1biBqdXN0IHVuZGVyIHNvbWUgY29uZGl0aW9uIChub3QKPiBhbHdheXMp
LCB0aHVzIG5vdCBzdWl0YWJsZSBmb3IgLm5lZWRzX2NtZHMsIGJ1dCBzdGlsbCBuaWNlIHRvIGhh
dmUgcmVsaWFibGUKPiBjaGVjay4gQnV0IG1heWJlIEknbSB3cm9uZy4KPgo+IEtpbmQgcmVnYXJk
cywKPiBQZXRyCj4KCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
