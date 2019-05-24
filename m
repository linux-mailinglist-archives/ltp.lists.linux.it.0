Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1A9291D8
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 09:36:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CBE4A3EA666
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 09:36:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 275263EA60D
 for <ltp@lists.linux.it>; Fri, 24 May 2019 09:36:13 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 866321003AC2
 for <ltp@lists.linux.it>; Fri, 24 May 2019 09:36:06 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,506,1549900800"; d="scan'208";a="64430769"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 24 May 2019 15:36:07 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id B74CE4CDBCDF;
 Fri, 24 May 2019 15:36:08 +0800 (CST)
Received: from [10.167.215.30] (10.167.215.30) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 24 May 2019 15:36:05 +0800
Message-ID: <5CE79EE4.40403@cn.fujitsu.com>
Date: Fri, 24 May 2019 15:36:04 +0800
From: xuyang <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Xiao Yang <ice_yangxiao@163.com>
References: <20190523094003.GC30616@rei.lan>
 <1558611333-10161-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <70578dc6-1a6b-9ab1-1298-0539ae8562f9@163.com>
In-Reply-To: <70578dc6-1a6b-9ab1-1298-0539ae8562f9@163.com>
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: B74CE4CDBCDF.A20C5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] syscalls/prctl05.c: New test for prctl() with
 PR_{SET, GET}_NAME
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

b24gMjAxOS8wNS8yMyAxOTo1MSwgWGlhbyBZYW5nIHdyb3RlOgo+Cj4KPiBPbiAwNS8yMy8yMDE5
IDA3OjM1IFBNLCBZYW5nIFh1IHdyb3RlOgo+PiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFh1IDx4dXlh
bmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPgo+PiAtLS0KPj4gICBpbmNsdWRlL2xhcGkvcHJjdGwu
aCAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKwo+PiAgIHJ1bnRlc3Qvc3lzY2FsbHMgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPj4gICB0ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL3ByY3RsLy5naXRpZ25vcmUgfCAgMSArCj4+ICAgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9wcmN0bC9wcmN0bDA1LmMgIHwgNzEgKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIDQgZmls
ZXMgY2hhbmdlZCwgNzggaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL3ByY3RsL3ByY3RsMDUuYwo+Pgo+PiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9sYXBpL3ByY3RsLmggYi9pbmNsdWRlL2xhcGkvcHJjdGwuaAo+PiBpbmRleCBmNDJi
ZDY0NTkuLmFkMGIxMmJjZSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9sYXBpL3ByY3RsLmgKPj4g
KysrIGIvaW5jbHVkZS9sYXBpL3ByY3RsLmgKPj4gQEAgLTksNiArOSwxMSBAQAo+PiAgICAgI2lu
Y2x1ZGUgPHN5cy9wcmN0bC5oPgo+PiAgICsjaWZuZGVmIFBSX1NFVF9OQU1FCj4+ICsjIGRlZmlu
ZSBQUl9TRVRfTkFNRSAxNQo+PiArIyBkZWZpbmUgUFJfR0VUX05BTUUgMTYKPj4gKyNlbmRpZgo+
PiArCj4+ICAgI2lmbmRlZiBQUl9TRVRfU0VDQ09NUAo+PiAgICMgZGVmaW5lIFBSX0dFVF9TRUND
T01QICAyMQo+PiAgICMgZGVmaW5lIFBSX1NFVF9TRUNDT01QICAyMgo+PiBkaWZmIC0tZ2l0IGEv
cnVudGVzdC9zeXNjYWxscyBiL3J1bnRlc3Qvc3lzY2FsbHMKPj4gaW5kZXggMDQ1NThhNTgwLi5k
MmRjZDIxNTIgMTAwNjQ0Cj4+IC0tLSBhL3J1bnRlc3Qvc3lzY2FsbHMKPj4gKysrIGIvcnVudGVz
dC9zeXNjYWxscwo+PiBAQCAtODYyLDYgKzg2Miw3IEBAIHByY3RsMDEgcHJjdGwwMQo+PiAgIHBy
Y3RsMDIgcHJjdGwwMgo+PiAgIHByY3RsMDMgcHJjdGwwMwo+PiAgIHByY3RsMDQgcHJjdGwwNAo+
PiArcHJjdGwwNSBwcmN0bDA1Cj4+ICAgICBwcmVhZDAxIHByZWFkMDEKPj4gICBwcmVhZDAxXzY0
IHByZWFkMDFfNjQKPj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcHJj
dGwvLmdpdGlnbm9yZSAKPj4gYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3ByY3RsLy5naXRp
Z25vcmUKPj4gaW5kZXggMWMzZGEzMDUyLi45ZWNhZjk4NTQgMTAwNjQ0Cj4+IC0tLSBhL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvcHJjdGwvLmdpdGlnbm9yZQo+PiArKysgYi90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL3ByY3RsLy5naXRpZ25vcmUKPj4gQEAgLTIsMyArMiw0IEBACj4+ICAg
L3ByY3RsMDIKPj4gICAvcHJjdGwwMwo+PiAgIC9wcmN0bDA0Cj4+ICsvcHJjdGwwNQo+PiBkaWZm
IC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmN0bC9wcmN0bDA1LmMgCj4+IGIv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmN0bC9wcmN0bDA1LmMKPj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwLi5mYWQ1YjIzYmYKPj4gLS0tIC9kZXYvbnVsbAo+
PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3ByY3RsL3ByY3RsMDUuYwo+PiBAQCAt
MCwwICsxLDcxIEBACj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1s
YXRlcgo+PiArLyoKPj4gKyAqIENvcHlyaWdodCAoYykgMjAxOSBGVUpJVFNVIExJTUlURUQuIEFs
bCByaWdodHMgcmVzZXJ2ZWQuCj4+ICsgKiBBdXRob3I6IFlhbmcgWHUgPHh1eWFuZzIwMTguanlA
Y24uZnVqaXRzdS5jb20+Cj4+ICsgKgo+PiArICogVGVzdCBQUl9HRVRfTkFNRSBhbmQgUFJfU0VU
X05BTUUgb2YgcHJjdGwoMikuCj4+ICsgKiAxKVNldCB0aGUgbmFtZSBvZiB0aGUgY2FsbGluZyB0
aHJlYWQsIHRoZSBuYW1lIGNhbiBiZSB1cCB0byAxNiBieXRlcwo+PiArICogICBsb25nLCBpbmNs
dWRpbmcgdGhlIHRlcm1pbmF0aW5nIG51bGwgYnl0ZS4gSWYgZXhjZWVkcyAxNiBieXRlcywgCj4+
IHRoZQo+PiArICogICBzdHJpbmcgaXMgc2lsZW50bHkgdHJ1bmNhdGVkLgo+PiArICogMilSZXR1
cm4gdGhlIG5hbWUgb2YgdGhlIGNhbGxpbmcgdGhyZWFkLCB0aGUgYnVmZmVyIHNob3VsZCBhbGxv
dyAKPj4gc3BhY2UKPj4gKyAqICAgZm9yIHVwIHRvIDE2IGJ5dGVzLCB0aGUgcmV0dXJuZWQgc3Ry
aW5nIHdpbGwgYmUgbnVsbC10ZXJtaW5hdGVkLgo+PiArICogMylDaGVjayAvcHJvYy9zZWxmL3Rh
c2svW3RpZF0vY29tbSBuYW1lIHdoZXRoZXIgbWF0Y2hlcyB0aGUgCj4+IHRocmVhZF9uYW1lLgo+
PiArICovCj4+ICsKPj4gKyNpbmNsdWRlIDxlcnJuby5oPgo+PiArI2luY2x1ZGUgPHN5cy90eXBl
cy5oPgo+PiArI2luY2x1ZGUgPHN5cy9wcmN0bC5oPgo+PiArI2luY2x1ZGUgPHN0cmluZy5oPgo+
PiArI2luY2x1ZGUgPHN0ZGlvLmg+Cj4+ICsjaW5jbHVkZSAibGFwaS9zeXNjYWxscy5oIgo+PiAr
I2luY2x1ZGUgImxhcGkvcHJjdGwuaCIKPj4gKyNpbmNsdWRlICJ0c3RfdGVzdC5oIgo+PiArCj4+
ICsjZGVmaW5lIHRocmVhZF9uYW1lICJwcmN0bDA1X3Rlc3RfeHh4eHgiCj4gSGkgWHUsCj4KPiBJ
dCBzZWVtcyBiZXR0ZXIgdG8gdXNlIHVwcGVyIGNhc2UgZm9yIG1hY3JvLgo+Cj4+ICsKPj4gK3N0
YXRpYyB2b2lkIHZlcmlmeV9wcmN0bCh2b2lkKQo+PiArewo+PiArICAgIGNoYXIgYnVmWzIwXTsK
Pj4gKyAgICBjaGFyIGNvbW1fYnVmWzIwXTsKPj4gKyAgICBjaGFyIFBST0NfTkFNRV9QQVRIWzQw
XTsKPj4gKyAgICBwaWRfdCB0aWQ7Cj4+ICsKPj4gKyAgICBURVNUKHByY3RsKFBSX1NFVF9OQU1F
LCAmdGhyZWFkX25hbWUpKTsKPgo+IFdoeSBkbyB5b3Ugd2FudCB0byB1c2UgdGhlIGFkZHJlc3Mg
b2YgbWFjcm8/Cj4KPj4gKyAgICBpZiAoVFNUX1JFVCA9PSAtMSkgewo+PiArICAgICAgICB0c3Rf
cmVzKFRGQUlMIHwgVFRFUlJOTywgInByY3RsKFBSX1NFVF9OQU1FKSBmYWlsZWQiKTsKPj4gKyAg
ICAgICAgcmV0dXJuOwo+PiArICAgIH0KPj4gKyAgICB0c3RfcmVzKFRQQVNTLAo+PiArICAgICAg
ICAicHJjdGwoUFJfU0VUX05BTUUpIHN1Y2NlZWRlZCwgc2V0IHRocmVhZCBuYW1lIGFzIAo+PiBw
cmN0bDA1X3Rlc3RfeHh4eHgiKTsKPgo+IEhvdyBhYm91dCB1c2luZyAoIi4uLnNldCB0aHJlYWQg
bmFtZSBhcyAlcyIsIHRocmVhZF9uYW1lKT8KPgo+PiArCj4+ICsgICAgVEVTVChwcmN0bChQUl9H
RVRfTkFNRSwgJmJ1ZikpOwo+Cj4gJmJ1ZiBpcyB0aGUgc2FtZSBhcyBidWYgaGVyZSBzbyB3ZSBj
YW4gdXNlIGJ1ZiBkaXJlY3RseS4KPgo+PiArICAgIGlmIChUU1RfUkVUID09IC0xKSB7Cj4+ICsg
ICAgICAgIHRzdF9yZXMoVEZBSUwgfCBUVEVSUk5PLCAicHJjdGwoUFJfR0VUX05BTUUpIGZhaWxl
ZCIpOwo+PiArICAgICAgICByZXR1cm47Cj4+ICsgICAgfQo+PiArCj4+ICsgICAgYnVmWzE5XSA9
ICdcMCc7Cj4+ICsgICAgaWYgKCFzdHJuY21wKHRocmVhZF9uYW1lLCBidWYsIDE1KSAmJiBzdHJs
ZW4oYnVmKSA9PSAxNSkKPj4gKyAgICAgICAgdHN0X3JlcyhUUEFTUywgInByY3RsKFBSX0dFVF9O
QU1FKSBzdWNjZWVkZWQsICIKPj4gKyAgICAgICAgICAgICAgICAidGhyZWFkIG5hbWUgaXMgJXMi
LCBidWYpOwo+PiArICAgIGVsc2UKPj4gKyAgICAgICAgdHN0X3JlcyhURkFJTCwKPj4gKyAgICAg
ICAgICAgICJwcmN0bChQUl9HRVRfTkFNRSkgZmFpbGVkIHRvIHRydW5jYXRlIHRoZSBuYW1lIGlu
dG8gMTYgCj4+IGJ5dGUgbG9uZyIpOwo+Cj4gQ2FuIHdlIHRlc3QgdGhlIHNob3J0ZXIgbmFtZSBv
ZiB0aGUgY2FsbGluZyB0aHJlYWQoaS5lLiBzaG9ydGVyIHRoYW4gCj4gMTYgYnl0ZSkgYXMgd2Vs
bD8KCkhpIHhpYW8KCiAgIE9LLiBJIHdpbGwgYWRkIGEgdGVzdCBmb3IgdGhlIHNob3J0ZXIgbmFt
ZSBhbmQgY29ycmVjdCBteSBjb2RlIGluIHYzIHBhdGNoLgogICBUaGFua3MgZm9yIHlvdXIgcmV2
aWV3LgoKQmVzdCBSZWdhcmRzCllhbmcgWHUKCj4KPiBCZXN0IFJlZ2FyZHMsCj4gWGlhbyBZYW5n
Cj4+ICsKPj4gKyAgICB0aWQgPSB0c3Rfc3lzY2FsbChfX05SX2dldHRpZCk7Cj4+ICsKPj4gKyAg
ICBzcHJpbnRmKFBST0NfTkFNRV9QQVRILCAiL3Byb2Mvc2VsZi90YXNrLyVkL2NvbW0iLCB0aWQp
Owo+PiArICAgIFNBRkVfRklMRV9TQ0FORihQUk9DX05BTUVfUEFUSCwgIiVzIiwgY29tbV9idWYp
Owo+PiArICAgIGlmIChzdHJjbXAoYnVmLCBjb21tX2J1ZikpCj4+ICsgICAgICAgIHRzdF9yZXMo
VEZBSUwsCj4+ICsgICAgICAgICAgICAiJXMgc2V0cyBuYW1lIGZhaWxlZCwgZXhwZWN0ZWQgcHJj
dGwxMDVfdGVzdF94eCwgZ290ICVzIiwKPj4gKyAgICAgICAgICAgIFBST0NfTkFNRV9QQVRILCBj
b21tX2J1Zik7Cj4+ICsgICAgZWxzZQo+PiArICAgICAgICB0c3RfcmVzKFRQQVNTLCAiJXMgc2V0
cyB0aHJlYWQgbmFtZSBzdWNjZWVkIGFzICVzIiwKPj4gKyAgICAgICAgICAgIFBST0NfTkFNRV9Q
QVRILCBjb21tX2J1Zik7Cj4+ICsKPj4gK30KPj4gKwo+PiArc3RhdGljIHN0cnVjdCB0c3RfdGVz
dCB0ZXN0ID0gewo+PiArICAgIC50ZXN0X2FsbCA9IHZlcmlmeV9wcmN0bCwKPj4gK307Cj4KPgo+
Cj4KPiAuCj4KCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
