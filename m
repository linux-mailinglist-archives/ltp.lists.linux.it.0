Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCBF146199
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 06:41:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ABB103C249A
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 06:41:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 5D8273C0EB6
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 06:41:13 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id E0BC560123C
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 06:41:11 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,352,1574092800"; d="scan'208";a="82508230"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Jan 2020 13:41:08 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 852A750A996A
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 13:31:51 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 23 Jan 2020 13:41:04 +0800
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <1579754906-7837-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5E292C45.2010604@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <14032013-3dd8-7beb-dc11-37018f7227fc@cn.fujitsu.com>
Date: Thu, 23 Jan 2020 13:40:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <5E292C45.2010604@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 852A750A996A.ACE87
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/socketcall: Use TCONF instead of TPASS
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

PiBIaSBYdSwKPiAKPiBBbGwgb2YgdGhlbSBhcmUgc2ltcGxlIHRlc3RzLgo+IEkgcGVyZmVyIHRv
IGNvbnZlcnQgdG8gbmV3IGxpYnJhcnkgYWxvbmcgd2l0aCB0aGUgbWlub3IgZml4LiA6LSkKSGkg
WGlhbwpPSy4gSSB3aWxsIGNsZWFuIHVwIHRoZW0gbGF0ZXIuCgpwczpVc2luZyBuZXcgbGlicmFy
eSBmb3IgYWxsIGx0cCBjYXNlcyBsb29rcyBsaWtlIGEgbG9uZyB3YXkgdG8gZ28uCgpCZXN0IFJl
Z2FyZHMKWWFuZyBYdQo+IAo+IFRoYW5rcywKPiBYaWFvIFlhbmcKPiBPbiAyMDIwLzEvMjMgMTI6
NDgsIFlhbmcgWHUgd3JvdGU6Cj4+IFNpZ25lZC1vZmYtYnk6IFlhbmcgWHU8eHV5YW5nMjAxOC5q
eUBjbi5mdWppdHN1LmNvbT4KPj4gLS0tCj4+IMKgIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
c29ja2V0Y2FsbC9zb2NrZXRjYWxsMDIuYyB8IDIgKy0KPj4gwqAgdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9zb2NrZXRjYWxsL3NvY2tldGNhbGwwMy5jIHwgMiArLQo+PiDCoCB0ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL3NvY2tldGNhbGwvc29ja2V0Y2FsbDA0LmMgfCAyICstCj4+IMKgIDMg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zb2NrZXRjYWxsL3NvY2tldGNhbGww
Mi5jIAo+PiBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc29ja2V0Y2FsbC9zb2NrZXRjYWxs
MDIuYwo+PiBpbmRleCBjZWMwMjQ2YTYuLjc1NzQ3ODJmZiAxMDA2NDQKPj4gLS0tIGEvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9zb2NrZXRjYWxsL3NvY2tldGNhbGwwMi5jCj4+ICsrKyBiL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc29ja2V0Y2FsbC9zb2NrZXRjYWxsMDIuYwo+PiBAQCAt
MTU2LDcgKzE1Niw3IEBAIGludCBUU1RfVE9UQUwgPSAwOwo+Pgo+PiDCoCBpbnQgbWFpbih2b2lk
KQo+PiDCoCB7Cj4+IC3CoMKgwqAgdHN0X3Jlc20oVFBBU1MsICJzb2NrZXQgY2FsbCB0ZXN0IG9u
IHRoaXMgYXJjaGl0ZWN0dXJlIGRpc2FibGVkLiIpOwo+PiArwqDCoMKgIHRzdF9yZXNtKFRDT05G
LCAic29ja2V0IGNhbGwgdGVzdCBvbiB0aGlzIGFyY2hpdGVjdHVyZSBkaXNhYmxlZC4iKTsKPj4g
wqDCoMKgwqDCoCB0c3RfZXhpdCgpOwo+PiDCoCB9Cj4+Cj4+IGRpZmYgLS1naXQgYS90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL3NvY2tldGNhbGwvc29ja2V0Y2FsbDAzLmMgCj4+IGIvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9zb2NrZXRjYWxsL3NvY2tldGNhbGwwMy5jCj4+IGluZGV4IDI0
NGEyODY3OC4uZDZjMDgyYzIxIDEwMDY0NAo+PiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL3NvY2tldGNhbGwvc29ja2V0Y2FsbDAzLmMKPj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9zb2NrZXRjYWxsL3NvY2tldGNhbGwwMy5jCj4+IEBAIC0xNzQsNyArMTc0LDcgQEAg
aW50IFRTVF9UT1RBTCA9IDA7Cj4+Cj4+IMKgIGludCBtYWluKHZvaWQpCj4+IMKgIHsKPj4gLcKg
wqDCoCB0c3RfcmVzbShUUEFTUywgInNvY2tldCBjYWxsIHRlc3Qgb24gdGhpcyBhcmNoaXRlY3R1
cmUgZGlzYWJsZWQuIik7Cj4+ICvCoMKgwqAgdHN0X3Jlc20oVENPTkYsICJzb2NrZXQgY2FsbCB0
ZXN0IG9uIHRoaXMgYXJjaGl0ZWN0dXJlIGRpc2FibGVkLiIpOwo+PiDCoMKgwqDCoMKgIHRzdF9l
eGl0KCk7Cj4+IMKgIH0KPj4KPj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvc29ja2V0Y2FsbC9zb2NrZXRjYWxsMDQuYyAKPj4gYi90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL3NvY2tldGNhbGwvc29ja2V0Y2FsbDA0LmMKPj4gaW5kZXggNTg0YzhmMzdhLi5jNDk4YjZl
NzQgMTAwNjQ0Cj4+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc29ja2V0Y2FsbC9z
b2NrZXRjYWxsMDQuYwo+PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3NvY2tldGNh
bGwvc29ja2V0Y2FsbDA0LmMKPj4gQEAgLTE2Nyw3ICsxNjcsNyBAQCBpbnQgVFNUX1RPVEFMID0g
MDsKPj4KPj4gwqAgaW50IG1haW4odm9pZCkKPj4gwqAgewo+PiAtwqDCoMKgIHRzdF9yZXNtKFRQ
QVNTLCAic29ja2V0IGNhbGwgdGVzdCBvbiB0aGlzIGFyY2hpdGVjdHVyZSBkaXNhYmxlZC4iKTsK
Pj4gK8KgwqDCoCB0c3RfcmVzbShUQ09ORiwgInNvY2tldCBjYWxsIHRlc3Qgb24gdGhpcyBhcmNo
aXRlY3R1cmUgZGlzYWJsZWQuIik7Cj4+IMKgwqDCoMKgwqAgdHN0X2V4aXQoKTsKPj4gwqAgfQo+
Pgo+IAoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
