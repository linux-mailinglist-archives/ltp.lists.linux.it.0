Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BD915A0B0
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 06:37:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E88E73C25DE
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 06:37:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5D5CA3C2284
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 06:37:02 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 304B86011CF
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 06:37:00 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; d="scan'208";a="83188066"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Feb 2020 13:36:58 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 7830150A9973;
 Wed, 12 Feb 2020 13:27:24 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 12 Feb 2020 13:36:54 +0800
Message-ID: <5E438EF5.1050800@cn.fujitsu.com>
Date: Wed, 12 Feb 2020 13:36:53 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
References: <BMXPR01MB29991144C5DF1108F9B38DD9EE180@BMXPR01MB2999.INDPRD01.PROD.OUTLOOK.COM>
 <f6cf7d37-cf31-7448-0bea-035eb48f2f79@163.com>
 <BMXPR01MB2999C5C6166A34812CFA3727EE180@BMXPR01MB2999.INDPRD01.PROD.OUTLOOK.COM>
 <6e81635f-c202-9f41-6795-4d6f84290e7e@163.com>
 <588cc009-d46f-4070-7b14-ea81f8dc6b76@cn.fujitsu.com>
In-Reply-To: <588cc009-d46f-4070-7b14-ea81f8dc6b76@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 7830150A9973.A81B3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

T24gMjAyMC8yLzExIDE4OjU1LCBZYW5nIFh1IHdyb3RlOgo+Cj4gb24gMjAyMC8wMi8xMSAxODoy
NSwgWGlhbyBZYW5nIHdyb3RlOgo+Pgo+PiBPbiAyLzExLzIwIDY6MDEgUE0sIFBhbmthaiBWaW5h
ZHJhbyBKb3NoaSB3cm90ZToKPj4+IEhpIHNpciwKPj4+IEkgYW0gYmVnZ2luZXIgY2FuIHlvdSB0
ZWxsIGhvdyBpIGNhbiAgY2hlY2sgaWYgdG1wZnMgaXMgbW91bnRlZCBvbiAKPj4+IC90bXAgaW4g
eW91ciBlbnZpcm9tZW50Pwo+Pgo+PiBIaSwKPj4KPj4KPj4gWW91IGNhbiB1c2UgZGYvbW91bnQg
Y29tbWFuZCB0byBkbyBjaGVjaywgYXMgYmVsb3c6Cj4+Cj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Cj4+IFtyb290
QEZlZG9yYS0zMC12bSBsaW51eF0jIGRmIC1oIHwgZ3JlcCAnL3RtcCcKPj4gdG1wZnMgICAgICAg
ICAgIDk5M00gIDQuMEsgIDk5M00gICAxJSAvdG1wCj4+Cj4+IFtyb290QEZlZG9yYS0zMC12bSBs
aW51eF0jIG1vdW50IHwgZ3JlcCAnL3RtcCcKPj4gdG1wZnMgb24gL3RtcCB0eXBlIHRtcGZzIChy
dyxub3N1aWQsbm9kZXYsc2VjbGFiZWwpCj4+Cj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pgo+Pj4KPj4+IFNpciBp
ZiB5b3UgaGF2ZSB0d28gbWludXRlcyBvZiB0aW1lIGNhbiB5b3UgZWxhYm9yYXRlIGl0IHdoYXRz
IGl0cyAKPj4+IG1lYW5pbmc/Cj4+Cj4+IGFpbzAyIHVzZXMgb3BlbihPX1dST05MWSB8IE9fVFJV
TkMgfCBPX0RJUkVDVCB8IE9fTEFSR0VGSUxFIHwgCj4+IE9fQ1JFQVQpIHRvCj4+Cj4+IGNyZWF0
ZSB0ZXN0IGZpbGUgaW4gZGVmYXVsdCAvdG1wIGRpcmVjdG9yeSBhbmQgKioqKk9fRElSRUNUIGZs
YWcgbWF5IAo+PiBub3QgYmUgc3VwcG9ydGVkCj4+Cj4+IGJ5IHRtcGZzIHNvIGNhbGxpbmcgb3Bl
bigpIHJldHVybnMgRUlOVkFMLgo+Pgo+IEhpIFhpYW8KPiBJIHRoaW5rIHdlIHNob3VsZCBhZGQg
YSBjaGVjayBvciB1c2UgYSB2YWxpZCBmaWxlc3lzdGVtIHRvIHRlc3QgaW4gCj4gdGhpcyBjYXNl
LgpIaSBYdSwKClNvcnJ5IGZvciBteSBsYXRlIHJlcGx5LgpTdXJlLCB3ZSBuZWVkIHRvIGZpeCB0
aGUgaXNzdWUgaW5kZWVkLgoKVGhhbmtzLApYaWFvIFlhbmcKPgo+IEJlc3QgUmVnYXJkcwo+IFlh
bmcgWHUKPj4KPj4gVGhhbmtzLAo+Pgo+PiBYaWFvIFlhbmcKPj4KPj4+Cj4+Pgo+Pj4gVGhhbmsg
eW91IPCfmIoKPj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAKPj4+Cj4+PiAqRnJvbToqIFhpYW8gWWFuZyA8
aWNlX3lhbmd4aWFvQDE2My5jb20+Cj4+PiAqU2VudDoqIFR1ZXNkYXksIEZlYnJ1YXJ5IDExLCAy
MDIwIDM6MDQgUE0KPj4+ICpUbzoqIFBhbmthaiBWaW5hZHJhbyBKb3NoaSA8UGFua2FqLlZKQGV4
YWxlYXBzZW1pLmNvbT4KPj4+ICpTdWJqZWN0OiogUmU6IFtMVFBdIHRlc3Qgd2l0aCBhaW8wMiBp
cyBmYWlsaW5nIHdpdGggCj4+PiBzYWZlX21hY3Jvcy5jOjIyMzogQlJPSzogYWlvMDIuYzoxMzA6
IG9wZW4oZmlsZSwgMTY5NjEsIDA2NDQpIAo+Pj4gZmFpbGVkOiBFSU5WQUwgKDIyKQo+Pj4KPj4+
IEhpLAo+Pj4KPj4+Cj4+PiBDb3VsZCB5b3UgY2hlY2sgaWYgdG1wZnMgaXMgbW91bnRlZCBvbiAv
dG1wIGluIHlvdXIgZW52aXJvbWVudD8KPj4+Cj4+PiBJdCBzZWVtcyB0aGF0IHRtcGZzIGNhbm5v
dCBzdXBwb3J0IE9fRElSRUNUIGZsYWcgYW5kIGNyZWF0aW5nIGZpbGUgCj4+PiB3aXRoIE9fRElS
RUNUIGluIHRtcGZzIHRyaWdnZXJzIHRoZSBlcnJvci4KPj4+Cj4+PiBQZXJoYXBzLCB5b3UgY2Fu
IGZpeCB0aGUgZXJyb3IgYnkgbW91bnRpbmcgbm9ybWFsIGZpbGVzeXN0ZW0oZS5nLiAKPj4+IGV4
dDQveGZzKSBvbiAvdG1wIGZvciBub3cuCj4+Pgo+Pj4KPj4+IFRoYW5rcywKPj4+Cj4+PiBYaWFv
IFlhbmcKPj4+Cj4+PiBPbiAyLzExLzIwIDQ6MzEgUE0sIFBhbmthaiBWaW5hZHJhbyBKb3NoaSB3
cm90ZToKPj4+PiBIaSwKPj4+PiBpIGFtIHJ1bm5pbmcgYWlvMDIgdGVzdCBvbiBteSBSSVNDIHYg
bWFjaGluZSxteSB0ZXN0aW5nIGlzIGdldHRpbmcgCj4+Pj4gZmFpbGVkIHdpdGggdGhlIG1lc3Nh
Z2UKPj4+PiAqc2FmZV9tYWNyb3MuYzoyMjM6IEJST0s6IGFpbzAyLmM6MTMwOiBvcGVuKGZpbGUs
MTY5NjEsMDY0NCkgCj4+Pj4gZmFpbGVkOiBFSU5WQUwgKDIyKSoKPj4+Pgo+Pj4gW0VYVF0KPj4K
Pj4KPgo+Cj4KCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
