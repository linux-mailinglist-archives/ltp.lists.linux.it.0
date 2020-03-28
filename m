Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 890CF1965D5
	for <lists+linux-ltp@lfdr.de>; Sat, 28 Mar 2020 12:38:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 257783C32A0
	for <lists+linux-ltp@lfdr.de>; Sat, 28 Mar 2020 12:38:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 931503C3288
 for <ltp@lists.linux.it>; Sat, 28 Mar 2020 12:38:29 +0100 (CET)
Received: from mail-m974.mail.163.com (mail-m974.mail.163.com [123.126.97.4])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id ECC611A00913
 for <ltp@lists.linux.it>; Sat, 28 Mar 2020 12:38:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=Yo0GG
 4Quk/gA1/6hYZkBu8sf71bP266PgdE3fPP0cTA=; b=Kb4p4WnFCDKQZRDhqP1kK
 7Zx8lJquaivOtw6Do72kZAVgiW7ibQ56v8K9mIRUcq6P+s8EoFHfYur6bYE3lQ2X
 ht33+WMmwUZ8sOdgnmXmHWzNk/e12oz1lIXI1BK9WGu695ub3P2qjHNL6I1vT0tu
 0l7dB7aPMRyCVE5aolfDQI=
Received: from [172.20.10.4] (unknown [122.194.1.239])
 by smtp4 (Coremail) with SMTP id HNxpCgC31bAmN39eoEmOAQ--.107S2;
 Sat, 28 Mar 2020 19:38:14 +0800 (CST)
To: Zou Wei <zou_wei@huawei.com>, ltp@lists.linux.it
References: <1585377584-9931-1-git-send-email-zou_wei@huawei.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <7640be42-53a5-c97e-e4ed-042dc323025a@163.com>
Date: Sat, 28 Mar 2020 19:38:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1585377584-9931-1-git-send-email-zou_wei@huawei.com>
Content-Language: en-US
X-CM-TRANSID: HNxpCgC31bAmN39eoEmOAQ--.107S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFy5Ar1xuryUGF18CF4UJwb_yoW8Gw4DpF
 W3Aw1vkrWkGF1rC3s2gFsYyw48XwnIyr4fWr4qkrZ8Ja4rA34rWrsFgFW5uw12qry8Gay5
 ua18Wr1Fga98AFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bbJPiUUUUU=
X-Originating-IP: [122.194.1.239]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiqAb0Xlc7OJKT5gAAs3
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/statx: Add judgment to the MODE value
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMy8yOC8yMCAyOjM5IFBNLCBab3UgV2VpIHdyb3RlOgo+IDEuIFRoZSBkZWZhdWx0IHZhbHVl
IG9mIHVtYXNrIGluIG1vc3QgbGludXggc3lzdGVtcyBpcyAwMDIyLCBidXQgaW4gc29tZSBvdGhl
ciBzeXN0ZW1zIGlzIDAwNzcsCj4gICAgIHdoaWNoIHJlc3VsdHMgaW4gZGlmZmVyZW50IE1PREUg
dmFsdWVzIHdoZW4gb3BlbmluZyBmaWxlcy4KPgo+IDIuIEFkZGluZyBqdWRnbWVudCB0byB0aGUg
TU9ERSB2YWx1ZSBjYW4gaW1wcm92ZSB0aGUgdmVyc2F0aWxpdHkgb2YgdGhpcyBjYXNlLgo+Cj4g
My4gNjMgdHJhbnNsYXRlcyB0byA3NyBpbiBvY3RhbCwgbWVhbmluZyB0aGUgcnVubmluZyBwcm9j
ZXNzIGhhcyBhIHVtYXNrIG9mIDAwMjIuCj4gICAgIFRoYXQgbWVhbnMgdGhlIHByb2Nlc3Mgd2ls
bCBvcGVuIGZpbGVzIHdpdGggMDYwMCBhcyBwZXJtaXNzaW9ucyBvbiB0aGUgZmlsZXN5c3RlbS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFpvdSBXZWkgPHpvdV93ZWlAaHVhd2VpLmNvbT4KPiAtLS0KPiAg
IHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3RhdHgvc3RhdHgwMS5jIHwgMiArLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zdGF0eC9zdGF0eDAxLmMgYi90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL3N0YXR4L3N0YXR4MDEuYwo+IGluZGV4IDRmOWQ1ODIuLmFkY2ExZDMg
MTAwNjQ0Cj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zdGF0eC9zdGF0eDAxLmMK
PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N0YXR4L3N0YXR4MDEuYwo+IEBAIC00
Nyw3ICs0Nyw3IEBACj4gICAjZGVmaW5lIFRFU1RGSUxFICJ0ZXN0X2ZpbGUiCj4gICAjZGVmaW5l
IE1OVFBPSU5UICJtbnRwb2ludC8iCj4gICAjZGVmaW5lIERFVklDRUZJTEUgTU5UUE9JTlQiYmxr
X2RldiIKPiAtI2RlZmluZSBNT0RFIDA2NDQKPiArI2RlZmluZSBNT0RFICgodW1hc2soMCk9PTYz
KT8wNjAwOjA2NDQpCgpIaSBab3UsCgoxKSBGb3IgdGhlIGZpeCwgSSB0aGluayB5b3UganVzdCBu
ZWVkIHRvIGNsZWFyIGN1cnJlbnQgbWFzayBieSB1bWFzaygwKSAKaW4gc2V0dXAoKS4KCjIpIERv
bid0IG1peCB0aGUgZml4IGFuZCBhZGRpbmcgY292ZXJhZ2UoaS5lLiBkaWZmZXJlbnQgcGVybWlz
c2lvbnMpLsKgIApQbGVhc2UgdXNlCgogwqDCoMKgIG90aGVyIHdheXMoY3JlYXRlIHR3byBmaWxl
cyB3aXRoIGRpZmZlcmVudCBwZXJtaXNzaW9ucyBvciBjaGFuZ2UgCnRoZSBwZXJtaXNzaW9uCgog
wqDCoMKgIGR1cmluZyB0ZXN0LCBldGMpIGlmIHlvdSB3YW50IHRvIHJ1biB0ZXN0IHdpdGggZGlm
ZmVyZW50IHBlcm1pc3Npb25zLgoKVGhhbmtzLAoKWGlhbyBZYW5nCgo+Cj4gICAjZGVmaW5lIFNJ
WkUgMjU2Cj4gICAjZGVmaW5lIE1BSk9SIDgKPiAtLQo+IDIuNi4yCj4KPgoKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
