Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5CB158D01
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2020 11:56:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 182593C238F
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2020 11:56:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8B7AF3C2358
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 11:56:03 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 63328201354
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 11:55:55 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; d="scan'208";a="83153136"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Feb 2020 18:55:42 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0A01B406AB15;
 Tue, 11 Feb 2020 18:46:07 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 11 Feb 2020 18:55:36 +0800
To: Xiao Yang <ice_yangxiao@163.com>
References: <BMXPR01MB29991144C5DF1108F9B38DD9EE180@BMXPR01MB2999.INDPRD01.PROD.OUTLOOK.COM>
 <f6cf7d37-cf31-7448-0bea-035eb48f2f79@163.com>
 <BMXPR01MB2999C5C6166A34812CFA3727EE180@BMXPR01MB2999.INDPRD01.PROD.OUTLOOK.COM>
 <6e81635f-c202-9f41-6795-4d6f84290e7e@163.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <588cc009-d46f-4070-7b14-ea81f8dc6b76@cn.fujitsu.com>
Date: Tue, 11 Feb 2020 18:55:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <6e81635f-c202-9f41-6795-4d6f84290e7e@163.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0A01B406AB15.AEB23
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] test with aio02 is failing with safe_macros.c:223: BROK:
 aio02.c:130: open(file, 16961, 0644) failed: EINVAL (22)
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
Cc: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>,
 LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Cm9uIDIwMjAvMDIvMTEgMTg6MjUsIFhpYW8gWWFuZyB3cm90ZToKPiAKPiBPbiAyLzExLzIwIDY6
MDEgUE0sIFBhbmthaiBWaW5hZHJhbyBKb3NoaSB3cm90ZToKPj4gSGkgc2lyLAo+PiBJIGFtIGJl
Z2dpbmVyIGNhbiB5b3UgdGVsbCBob3cgaSBjYW7CoCBjaGVjayBpZiB0bXBmcyBpcyBtb3VudGVk
IG9uIAo+PiAvdG1wIGluIHlvdXIgZW52aXJvbWVudD8KPiAKPiBIaSwKPiAKPiAKPiBZb3UgY2Fu
IHVzZSBkZi9tb3VudCBjb21tYW5kIHRvIGRvIGNoZWNrLCBhcyBiZWxvdzoKPiAKPiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+IAo+IFtyb290QEZlZG9yYS0zMC12bSBsaW51eF0jIGRmIC1oIHwgZ3JlcCAnL3RtcCcKPiB0
bXBmc8KgwqDCoMKgwqDCoMKgwqDCoMKgIDk5M03CoCA0LjBLwqAgOTkzTcKgwqAgMSUgL3RtcAo+
IAo+IFtyb290QEZlZG9yYS0zMC12bSBsaW51eF0jIG1vdW50IHwgZ3JlcCAnL3RtcCcKPiB0bXBm
cyBvbiAvdG1wIHR5cGUgdG1wZnMgKHJ3LG5vc3VpZCxub2RldixzZWNsYWJlbCkKPiAKPiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPiAKPj4KPj4gU2lyIGlmIHlvdSBoYXZlIHR3byBtaW51dGVzIG9mIHRpbWUgY2FuIHlv
dSBlbGFib3JhdGUgaXQgd2hhdHMgaXRzIAo+PiBtZWFuaW5nPwo+IAo+IGFpbzAyIHVzZXMgb3Bl
bihPX1dST05MWSB8IE9fVFJVTkMgfCBPX0RJUkVDVCB8IE9fTEFSR0VGSUxFIHwgT19DUkVBVCkg
dG8KPiAKPiBjcmVhdGUgdGVzdCBmaWxlIGluIGRlZmF1bHQgL3RtcCBkaXJlY3RvcnkgYW5kICoq
KipPX0RJUkVDVCBmbGFnIG1heSBub3QgCj4gYmUgc3VwcG9ydGVkCj4gCj4gYnkgdG1wZnMgc28g
Y2FsbGluZyBvcGVuKCkgcmV0dXJucyBFSU5WQUwuCj4KSGkgWGlhbwpJIHRoaW5rIHdlIHNob3Vs
ZCBhZGQgYSBjaGVjayBvciB1c2UgYSB2YWxpZCBmaWxlc3lzdGVtIHRvIHRlc3QgaW4gdGhpcyAK
Y2FzZS4KCkJlc3QgUmVnYXJkcwpZYW5nIFh1Cj4gCj4gVGhhbmtzLAo+IAo+IFhpYW8gWWFuZwo+
IAo+Pgo+Pgo+PiBUaGFuayB5b3Ug8J+Yigo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gKkZyb206KiBY
aWFvIFlhbmcgPGljZV95YW5neGlhb0AxNjMuY29tPgo+PiAqU2VudDoqIFR1ZXNkYXksIEZlYnJ1
YXJ5IDExLCAyMDIwIDM6MDQgUE0KPj4gKlRvOiogUGFua2FqIFZpbmFkcmFvIEpvc2hpIDxQYW5r
YWouVkpAZXhhbGVhcHNlbWkuY29tPgo+PiAqU3ViamVjdDoqIFJlOiBbTFRQXSB0ZXN0IHdpdGgg
YWlvMDIgaXMgZmFpbGluZyB3aXRoIAo+PiBzYWZlX21hY3Jvcy5jOjIyMzogQlJPSzogYWlvMDIu
YzoxMzA6IG9wZW4oZmlsZSwgMTY5NjEsIDA2NDQpIGZhaWxlZDogCj4+IEVJTlZBTCAoMjIpCj4+
Cj4+IEhpLAo+Pgo+Pgo+PiBDb3VsZCB5b3UgY2hlY2sgaWYgdG1wZnMgaXMgbW91bnRlZCBvbiAv
dG1wIGluIHlvdXIgZW52aXJvbWVudD8KPj4KPj4gSXQgc2VlbXMgdGhhdCB0bXBmcyBjYW5ub3Qg
c3VwcG9ydCBPX0RJUkVDVCBmbGFnIGFuZCBjcmVhdGluZyBmaWxlIAo+PiB3aXRoIE9fRElSRUNU
IGluIHRtcGZzIHRyaWdnZXJzIHRoZSBlcnJvci4KPj4KPj4gUGVyaGFwcywgeW91IGNhbiBmaXgg
dGhlIGVycm9yIGJ5IG1vdW50aW5nIG5vcm1hbCBmaWxlc3lzdGVtKGUuZy4gCj4+IGV4dDQveGZz
KSBvbiAvdG1wIGZvciBub3cuCj4+Cj4+Cj4+IFRoYW5rcywKPj4KPj4gWGlhbyBZYW5nCj4+Cj4+
IE9uIDIvMTEvMjAgNDozMSBQTSwgUGFua2FqIFZpbmFkcmFvIEpvc2hpIHdyb3RlOgo+Pj4gSGks
Cj4+PiBpIGFtIHJ1bm5pbmcgYWlvMDIgdGVzdCBvbiBteSBSSVNDIHYgbWFjaGluZSxteSB0ZXN0
aW5nIGlzIGdldHRpbmcgCj4+PiBmYWlsZWQgd2l0aCB0aGUgbWVzc2FnZQo+Pj4gKnNhZmVfbWFj
cm9zLmM6MjIzOiBCUk9LOiBhaW8wMi5jOjEzMDogb3BlbihmaWxlLDE2OTYxLDA2NDQpIGZhaWxl
ZDogCj4+PiBFSU5WQUwgKDIyKSoKPj4+Cj4+IFtFWFRdCj4gCj4gCgoKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
