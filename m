Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1629C5F46B
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 10:17:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BBDAC3C1DA5
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 10:17:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 43C563C1D35
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 10:17:45 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E70BC100172F
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 10:17:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1361F308FF2C;
 Thu,  4 Jul 2019 08:17:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0900A176AD;
 Thu,  4 Jul 2019 08:17:43 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0038D1833001;
 Thu,  4 Jul 2019 08:17:42 +0000 (UTC)
Date: Thu, 4 Jul 2019 04:17:39 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Song Hongzhi <hongzhi.song@windriver.com>
Message-ID: <168662696.31634307.1562228259867.JavaMail.zimbra@redhat.com>
In-Reply-To: <faeb7464-f0c8-b97e-3b0b-7f38c2e94b99@windriver.com>
References: <dc4e1e30-face-9039-db90-5a6dae2fc2ea@windriver.com>
 <1731168043.30655111.1561720172996.JavaMail.zimbra@redhat.com>
 <77f916ad-58e3-bf0c-e1e7-da8fc3397ba4@windriver.com>
 <818477200.31466413.1562158387201.JavaMail.zimbra@redhat.com>
 <286312662.31605904.1562198532095.JavaMail.zimbra@redhat.com>
 <faeb7464-f0c8-b97e-3b0b-7f38c2e94b99@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.27]
Thread-Topic: Bug Report: diotest4 fails on mips64
Thread-Index: mxRSRpre1xI0s65Lmq58aaGoIRH/KQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 04 Jul 2019 08:17:43 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] Bug Report: diotest4 fails on mips64
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gCj4gT24gNy80LzE5IDg6MDIgQU0sIEph
biBTdGFuY2VrIHdyb3RlOgo+ID4KPiA+IC0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiA+
PiAtLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gPj4+IFRoYW5rcyBmb3IgeW91ciB3b3Jr
Lgo+ID4+Pgo+ID4+PiBJIHdpbGwgYmFja3BvcnQgdGhlIHBhdGNoIHRvIG15IHByb2plY3QgYWZ0
ZXIgbWVyZ2VkLgo+ID4+IERvZXMgaXQgbWVhbiwgdGhhdCBwYXRjaCBJIHBvc3RlZCBmaXhlcyBw
cm9ibGVtIGZvciB5b3U/Cj4gPj4KPiA+PiBEbyB5b3UgaGF2ZSBnb29kL2JhZCBrZXJuZWwgdmVy
c2lvbj8gSSB3YXMgbG9va2luZyBhdCByZWNlbnQKPiA+PiB1cHN0cmVhbSBjaGFuZ2VzLCBidXQg
ZGlkbid0IHNwb3QgYW55dGhpbmcgdGhhdCBjb3VsZCBleHBsYWluCj4gPj4gdGhhdCBFSU5WQUwu
Cj4gPiBQcm9ibGVtIGFwcGVhcnMgdG8gYmUgdGhhdCAibW1hcC5oIiBkb2Vzbid0IGluY2x1ZGUg
ImNvbmZpZy5oIiwKPiA+IHNvIE1NQVBfR1JBTlVMQVJJVFkgZW5kcyB1cCBiZWluZyBqdXN0IHNp
bmdsZSBwYWdlLgo+IAo+IFNvcnJ5LCBjYW4geW91IHRlbGwgbWUgdGhlIHJlbGF0aW9uc2hpcCBi
ZXR3ZWVuIGNvbmZpZy5oIGFuZAo+IE1NQVBfR1JBTlVMQVJJVFkgPwoKY29uZmlndXJlIGRldGVj
dHMgdGhhdCB5b3UgaGF2ZSBzeXMvc21oLmgsIHdoaWNoIGlzIHJlY29yZGVkIGluIGNvbmZpZy5o
OgogIC8qIERlZmluZSB0byAxIGlmIHlvdSBoYXZlIHRoZSA8c3lzL3NobS5oPiBoZWFkZXIgZmls
ZS4gKi8KICAjZGVmaW5lIEhBVkVfU1lTX1NITV9IIDEKCklmIHlvdXIgcGxhdGZvcm0gaGFzIHNo
bS5oLCB0aGVuIE1NQVBfR1JBTlVMQVJJVFkgaXMgZGVmaW5lIGFzIFNITUxCQSwKb3RoZXJ3aXNl
IGFzIHNpbmdsZSBwYWdlLgoKSWYgbGFwaS9tbWFwLmggZG9lc24ndCBpbmNsdWRlIGNvbmZpZy5o
LCB0aGVuIGl0J3MgYWx3YXlzIHRoZSBsYXR0ZXIsCmJlY2F1c2UgSEFWRV9TWVNfU0hNX0ggaXMg
dW5kZWZpbmVkLgoKPiAKPiBJIHRlc3RlZCBzZXZlcmFsIHRpbWVzIHRoYXQgaW5jbHVkaW5nICJj
b25maWcuaCIgaW5kZWVkIGZpeGVkIHRoZSBidWcuCj4gCj4gCj4gPgo+ID4gRm9sbG93aW5nIGZp
eGVzIGl0IGZvciBtZSBvbiBxZW11IGVtdWxhdGVkIDVrYy1tYWx0YSwgcnVubmluZyA1LjIuMC1y
Yzc6Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGFwaS9tbWFwLmggYi9pbmNsdWRlL2xh
cGkvbW1hcC5oCj4gPiBpbmRleCAxODU0N2MwZDQuLjk4YjZhZGUxZSAxMDA2NDQKPiA+IC0tLSBh
L2luY2x1ZGUvbGFwaS9tbWFwLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGFwaS9tbWFwLmgKPiA+IEBA
IC0xOSw2ICsxOSw4IEBACj4gPiAgICNpZm5kZWYgTEFQSV9NTUFQX0hfXwo+ID4gICAjZGVmaW5l
IExBUElfTU1BUF9IX18KPiA+Cj4gPiArI2luY2x1ZGUgImNvbmZpZy5oIgo+ID4gKwo+ID4gICAj
aWZuZGVmIE1BUF9IVUdFVExCCj4gPiAgICMgZGVmaW5lIE1BUF9IVUdFVExCIDB4NDAwMDAKPiA+
ICAgI2VuZGlmCj4gPgo+ID4gYnV0IHN0aWxsLCBwZXJoYXBzIHdlIHNob3VsZCBhbHNvIGRyb3Ag
dGhhdCBNQVBfRklYRUQuCj4gCj4gCj4gQWdyZWUgd2l0aCBpdC4gQ291bGQgSSBzZW5kIHRoZSBw
YXRjaCB3aXRoIHlvdXIgc2lnbmVkLW9mZj8KCkkgc2VudCBvbmUgfjIwIG1pbnV0ZXMgYWdvLCB5
b3Ugc2hvdWxkIGJlIG9uIENDLgoKPiAKPiAtLUhvbmd6aGkKPiAKPiAKPiA+Cj4gPj4+Cj4gPj4+
IC0tSG9uZ3poaQo+ID4+Pgo+ID4+Pgo+ID4+Pgo+ID4+PiBPbiA2LzI4LzE5IDc6MDkgUE0sIEph
biBTdGFuY2VrIHdyb3RlOgo+ID4+Pj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4+
Pj4+ICpMdHA6Kgo+ID4+Pj4+Cj4gPj4+Pj4gbGF0ZXN0IG1hc3Rlcgo+ID4+Pj4+Cj4gPj4+Pj4K
PiA+Pj4+PiAqS2VybmVsOioKPiA+Pj4+Pgo+ID4+Pj4+IEFmdGVyIHY1LjEgQVJDSD1taXBzNjQK
PiA+Pj4+Pgo+ID4+Pj4+Cj4gPj4+Pj4gKkVycm9yIGluZm86Kgo+ID4+Pj4+Cj4gPj4+Pj4gZGlv
dGVzdDQgMTAgVEJST0sgOiBkaW90ZXN0NC5jOjM2ODogY2FuJ3QgbW1hcCBmaWxlOiBJbnZhbGlk
IGFyZ3VtZW50Cj4gPj4+Pj4gZGlvdGVzdDQgMTEgVEJST0sgOiBkaW90ZXN0NC5jOjM2ODogUmVt
YWluaW5nIGNhc2VzIGJyb2tlbgo+ID4+Pj4+Cj4gPj4+Pj4KPiA+Pj4+PiBJIHRoaW5rIHRoZSBm
aXJzdCBhcmd1bWVudCBvZiBtbWFwIGlzIGludmFsaWQuCj4gPj4+Pj4KPiA+Pj4+PiAgICDCoMKg
ID5zaG1fYmFzZSA9IChjaGFyICopKCgobG9uZylzYnJrKDApICsgKHNobXN6IC0gMSkpICYgfihz
aG1zeiAtCj4gPj4+Pj4gICAgwqDCoCA+MSkpOwo+ID4+Pj4+Cj4gPj4+Pj4gICAgwqDCoCA+c2ht
X2Jhc2UgPSBtbWFwKHNobV9iYXNlLCAweDEwMDAwMCwgUFJPVF9SRUFEIHwgUFJPVF9XUklURSwK
PiA+Pj4+IEkgZG9uJ3Qgc2VlIGFueSBub3RlIHdoeSB0aGF0IG1tYXAgbmVlZHMgdG8gYmUgTUFQ
X0ZJWEVELiBJJ2QgZHJvcCBpdCwKPiA+Pj4+IGxldCBrZXJuZWwgcGljayBhbiBhZGRyZXNzOgo+
ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL2lvL2RpcmVjdF9pby9k
aW90ZXN0NC5jCj4gPj4+PiBiL3Rlc3RjYXNlcy9rZXJuZWwvaW8vZGlyZWN0X2lvL2Rpb3Rlc3Q0
LmMKPiA+Pj4+IGluZGV4IGU0NjE2ZTQwMGFiZC4uYmYyMDBjZDQxYTI3IDEwMDY0NAo+ID4+Pj4g
LS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9pby9kaXJlY3RfaW8vZGlvdGVzdDQuYwo+ID4+Pj4gKysr
IGIvdGVzdGNhc2VzL2tlcm5lbC9pby9kaXJlY3RfaW8vZGlvdGVzdDQuYwo+ID4+Pj4gQEAgLTM1
MiwxOCArMzUyLDE0IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCj4gPj4+PiAg
ICAgICAgICAgdG90YWwrKzsKPiA+Pj4+Cj4gPj4+PiAgICAgICAgICAgLyogVGVzdC0xMDogcmVh
ZCwgd3JpdGUgdG8gYSBtbWFwZWQgZmlsZSAqLwo+ID4+Pj4gLSAgICAgICBzaG1fYmFzZSA9IChj
aGFyICopKCgobG9uZylzYnJrKDApICsgKHNobXN6IC0gMSkpICYgfihzaG1zeiAtCj4gPj4+PiAx
KSk7Cj4gPj4+PiAtICAgICAgIGlmIChzaG1fYmFzZSA9PSBOVUxMKSB7Cj4gPj4+PiAtICAgICAg
ICAgICAgICAgdHN0X2Jya20oVEJST0ssIGNsZWFudXAsICJzYnJrIGZhaWxlZDogJXMiLAo+ID4+
Pj4gc3RyZXJyb3IoZXJybm8pKTsKPiA+Pj4+IC0gICAgICAgfQo+ID4+Pj4gICAgICAgICAgIG9m
ZnNldCA9IDQwOTY7Cj4gPj4+PiAgICAgICAgICAgY291bnQgPSBidWZzaXplOwo+ID4+Pj4gICAg
ICAgICAgIGlmICgoZmQgPSBvcGVuKGZpbGVuYW1lLCBPX0RJUkVDVCB8IE9fUkRXUikpIDwgMCkg
ewo+ID4+Pj4gICAgICAgICAgICAgICAgICAgdHN0X2Jya20oVEJST0ssIGNsZWFudXAsICJjYW4n
dCBvcGVuICVzOiAlcyIsCj4gPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBmaWxlbmFt
ZSwgc3RyZXJyb3IoZXJybm8pKTsKPiA+Pj4+ICAgICAgICAgICB9Cj4gPj4+PiAtICAgICAgIHNo
bV9iYXNlID0gbW1hcChzaG1fYmFzZSwgMHgxMDAwMDAsIFBST1RfUkVBRCB8IFBST1RfV1JJVEUs
Cj4gPj4+PiAtICAgICAgICAgICAgICAgICAgICAgICBNQVBfU0hBUkVEIHwgTUFQX0ZJWEVELCBm
ZCwgMCk7Cj4gPj4+PiArICAgICAgIHNobV9iYXNlID0gbW1hcCgwLCAweDEwMDAwMCwgUFJPVF9S
RUFEIHwgUFJPVF9XUklURSwKPiA+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIE1BUF9TSEFS
RUQsIGZkLCAwKTsKPiA+Pj4+ICAgICAgICAgICBpZiAoc2htX2Jhc2UgPT0gKGNhZGRyX3QpIC0g
MSkgewo+ID4+Pj4gICAgICAgICAgICAgICAgICAgdHN0X2Jya20oVEJST0ssIGNsZWFudXAsICJj
YW4ndCBtbWFwIGZpbGU6ICVzIiwKPiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cmVycm9yKGVycm5vKSk7Cj4gPj4+Pgo+ID4+IC0tCj4gPj4gTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCj4gPj4KPiAKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
