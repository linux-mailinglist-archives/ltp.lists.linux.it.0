Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6E1306CEC
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 06:30:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A39EB3C2FF3
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 06:30:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 177643C2FE3
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 06:30:32 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 9A5261400F49
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 06:30:31 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="103925251"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Jan 2021 13:30:26 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 00BCD48990D2
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 13:30:22 +0800 (CST)
Received: from irides.mr (10.167.225.141) by G08CNEXMBPEKD05.g08.fujitsu.local
 (10.167.33.204) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 28 Jan 2021 13:30:21 +0800
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <20210127102234.1282037-1-ruansy.fnst@cn.fujitsu.com>
 <601227EF.4080105@cn.fujitsu.com>
From: Ruan Shiyang <ruansy.fnst@cn.fujitsu.com>
Message-ID: <05e9d284-407a-9c42-afcc-6200363d419a@cn.fujitsu.com>
Date: Thu, 28 Jan 2021 13:30:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <601227EF.4080105@cn.fujitsu.com>
Content-Language: en-US
X-Originating-IP: [10.167.225.141]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 00BCD48990D2.AE6A8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: ruansy.fnst@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/time{01,
 02}: Convert to new API and merge them
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

CgpPbiAyMDIxLzEvMjgg5LiK5Y2IMTA6NTYsIFhpYW8gWWFuZyB3cm90ZToKPiBPbiAyMDIxLzEv
MjcgMTg6MjIsIFNoaXlhbmcgUnVhbiB3cm90ZToKPj4gTWVyZ2UgdGhlIHR3byBjYXNlcyBiZWNh
dXNlIGVhY2ggb2YgdGhlbSBpcyB2ZXJ5IHNpbXBsZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU2hp
eWFuZyBSdWFuPHJ1YW5zeS5mbnN0QGNuLmZ1aml0c3UuY29tPgo+PiAtLS0KPj4gwqAgdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy90aW1lL3RpbWUwMS5jIHwgMjA0ICsrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLQo+PiDCoCB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3RpbWUvdGltZTAyLmMgfCAx
NDcgLS0tLS0tLS0tLS0tLS0tLS0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25z
KCspLCAzMDQgZGVsZXRpb25zKC0pCj4+IMKgIGRlbGV0ZSBtb2RlIDEwMDY0NCB0ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL3RpbWUvdGltZTAyLmMKPiBIaSBSdWFuLAo+IAo+IFlvdSBhbHNvIG5l
ZWQgdG8gcmVtb3ZlIGFsbCBlbnRyaWVzIHJlbGVhdGVkIHRvIHRpbWUwMiwgZm9yIGV4YW1wbGU6
Cj4gcnVudGVzdC9zeXNjYWxsczp0aW1lMDIgdGltZTAyCj4gdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy90aW1lLy5naXRpZ25vcmU6L3RpbWUwMiA+CgpZZXMsIEkgZm9yZ290IHRoYXQuCgouLi4K
Cj4+ICsvKlwKPj4gKyAqIFtERVNDUklQVElPTl0KPj4gKyAqIDEpIEJhc2ljIHRlc3QgZm9yIHRo
ZSB0aW1lKDIpIHN5c3RlbSBjYWxsLiBJdCBpcyBpbnRlbmRlZCB0byAKPj4gcHJvdmlkZSBhCj4+
ICsgKiBsaW1pdGVkIGV4cG9zdXJlIG9mIHRoZSBzeXN0ZW0gY2FsbC4KPj4gKyAqIDIpIFZlcmlm
eSB0aGF0IHRpbWUoMikgcmV0dXJucyB0aGUgdmFsdWUgb2YgdGltZSBpbiBzZWNvbmRzIHNpbmNl
IAo+PiB0aGUgRXBvY2gKPj4gKyAqIGFuZCBzdG9yZXMgdGhpcyB2YWx1ZSBpbiB0aGUgbWVtb3J5
IHBvaW50ZWQgdG8gYnkgdGhlIHBhcmFtZXRlci4KPj4gK1wqLwo+IAo+IEl0IGlzIGJldHRlciB0
byByZXBsYWNlIHRoZSBudW1iZXIgd2l0aCAnLScgc28gdGhhdCBpdCBmb2xsb3dzIHRoZSAKPiBt
YXJrZG93biBsaXN0Lgo+IAoKT0suCgo+Pgo+PiAtdm9pZCBzZXR1cCgpOwo+PiAtdm9pZCBjbGVh
bnVwKCk7Cj4+ICsjaW5jbHVkZTx0aW1lLmg+Cj4+ICsjaW5jbHVkZTxlcnJuby5oPgo+Pgo+PiAt
Y2hhciAqVENJRCA9ICJ0aW1lMDEiOwo+PiAtaW50IFRTVF9UT1RBTCA9IDE7Cj4+ICsjaW5jbHVk
ZSAidHN0X3Rlc3QuaCIKPj4KPj4gLWludCBtYWluKGludCBhYywgY2hhciAqKmF2KQo+PiArc3Rh
dGljIHZvaWQgdmVyaWZ5X3RpbWUodm9pZCkKPj4gwqAgewo+PiAtwqDCoMKgIGludCBsYzsKPj4g
LQo+PiAtwqDCoMKgIHRzdF9wYXJzZV9vcHRzKGFjLCBhdiwgTlVMTCwgTlVMTCk7Cj4+IC0KPj4g
LcKgwqDCoCBzZXR1cCgpOwo+PiAtCj4+IC3CoMKgwqAgZm9yIChsYyA9IDA7IFRFU1RfTE9PUElO
RyhsYyk7IGxjKyspIHsKPj4gK8KgwqDCoCBURVNUKHRpbWUoMCkpOwo+Pgo+PiAtwqDCoMKgwqDC
oMKgwqAgdHN0X2NvdW50ID0gMDsKPj4gLQo+PiAtwqDCoMKgwqDCoMKgwqAgLyoKPj4gLcKgwqDC
oMKgwqDCoMKgwqAgKiBDYWxsIHRpbWUoMikKPj4gLcKgwqDCoMKgwqDCoMKgwqAgKi8KPj4gLcKg
wqDCoMKgwqDCoMKgIFRFU1QodGltZSgwKSk7Cj4+IC0KPj4gLcKgwqDCoMKgwqDCoMKgIC8qIGNo
ZWNrIHJldHVybiBjb2RlICovCj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoVEVTVF9SRVRVUk4gPT0g
LTEpIHsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHN0X3Jlc20oVEZBSUwsICJ0aW1lKDAp
IEZhaWxlZCwgZXJybm89JWQgOiAlcyIsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBURVNUX0VSUk5PLCBzdHJlcnJvcihURVNUX0VSUk5PKSk7Cj4+IC3CoMKgwqDCoMKgwqDC
oCB9IGVsc2Ugewo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0c3RfcmVzbShUUEFTUywgInRp
bWUoMCkgcmV0dXJuZWQgJWxkIiwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFRFU1RfUkVUVVJOKTsKPj4gLcKgwqDCoMKgwqDCoMKgIH0KPj4gLcKgwqDCoCB9Cj4+IC0KPj4g
LcKgwqDCoCBjbGVhbnVwKCk7Cj4+IC3CoMKgwqAgdHN0X2V4aXQoKTsKPj4gK8KgwqDCoCBpZiAo
VFNUX1JFVCA9PSAtMSkKPj4gK8KgwqDCoMKgwqDCoMKgIHRzdF9yZXMoVEZBSUwgfCBUVEVSUk5P
LCAidGltZSgwKSIpOwo+PiArwqDCoMKgIGVsc2UKPj4gK8KgwqDCoMKgwqDCoMKgIHRzdF9yZXMo
VFBBU1MsICJ0aW1lKDApIHJldHVybmVkICVsZCIsIFRTVF9SRVQpOwo+PiDCoCB9Cj4+Cj4+IC0v
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqCj4+IC0gKiBzZXR1cCgpIC0gcGVyZm9ybXMgYWxsIE9ORSBUSU1FIHNldHVwIGZvciB0
aGlzIHRlc3QuCj4+IC0gKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqLwo+PiAtdm9pZCBzZXR1cCh2b2lkKQo+PiArc3RhdGljIHZv
aWQgdmVyaWZ5X3RpbWVfc3RvcmUodm9pZCkKPj4gwqAgewo+PiAtwqDCoMKgIHZvaWQgdHJhcHBl
cigpOwo+PiAtCj4+IC3CoMKgwqAgdHN0X3NpZyhOT0ZPUkssIERFRl9IQU5ETEVSLCBjbGVhbnVw
KTsKPj4gLQo+PiAtwqDCoMKgIFRFU1RfUEFVU0U7Cj4+ICvCoMKgwqAgdGltZV90IHRsb2M7Cj4+
ICsKPj4gK8KgwqDCoCBURVNUKHRpbWUoJnRsb2MpKTsKPj4gKwo+PiArwqDCoMKgIGlmIChUU1Rf
UkVUID09IC0xKQo+PiArwqDCoMKgwqDCoMKgwqAgdHN0X3JlcyhURkFJTCB8IFRURVJSTk8sICJ0
aW1lKCZ0bG9jKSIpOwo+PiArwqDCoMKgIGVsc2UKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICh0bG9j
ID09IFRTVF9SRVQpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRzdF9yZXMoVFBBU1MsICJ0
aW1lKCZ0bG9jKSByZXR1cm5lZCB2YWx1ZSAlbGQsICIKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJzdG9yZWQgdmFsdWUgJWpkIGFyZSBzYW1lIiwKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRTVF9SRVQsIChp
bnRtYXhfdCkgdGxvYyk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBlbHNlCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHRzdF9yZXMoVEZBSUwsICJ0aW1lKCZ0bG9jKSByZXR1cm5lZCB2YWx1ZSAlbGQs
ICIKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJzdG9y
ZWQgdmFsdWUgJWpkIGFyZSBkaWZmZXJlbnQiLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgVFNUX1JFVCwgKGludG1heF90KSB0bG9jKTsKPj4gwqAgfQo+
Pgo+PiAtLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKgo+PiAtICogY2xlYW51cCgpIC0gcGVyZm9ybXMgYWxsIE9ORSBUSU1FIGNs
ZWFudXAgZm9yIHRoaXMgdGVzdCBhdAo+PiAtICrCoMKgwqDCoMKgwqDCoCBjb21wbGV0aW9uIG9y
IHByZW1hdHVyZSBleGl0Lgo+PiAtICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKi8KPj4gLXZvaWQgY2xlYW51cCh2b2lkKQo+PiAr
c3RydWN0IHRjYXNlIHsKPj4gK8KgwqDCoCB2b2lkICgqdmVyaWZ5KSh2b2lkKTsKPj4gK30gdGNh
c2VzW10gPSB7Cj4+ICvCoMKgwqAgeyZ2ZXJpZnlfdGltZSB9LAo+PiArwqDCoMKgIHsmdmVyaWZ5
X3RpbWVfc3RvcmUgfSwKPj4gK307Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIHJ1bih1bnNpZ25lZCBp
bnQgaSkKPj4gwqAgewo+PiArwqDCoMKgIHRjYXNlc1tpXS52ZXJpZnkoKTsKPj4gwqAgfQo+IEkg
dGhpbmsgd2UgZG9uJ3QgbmVlZCB0byBkZWZpbmUgdHdvIGRpZmZlcmVudCBmdW5jdGlvbnMuCj4g
SG93IGFib3V0IGRlZmluaW5nIGRpZmZlcmVudCBhcmd1bWVudHMgYW5kIHRoZW4gcGFzcyB0aGVt
IHRvIHRpbWUoKT8gZm9yIAo+IGV4YW1wbGU6Cj4gc3RydWN0IHRpbWVfdCAqYXJnc1syXT0ge05V
TEwsICZ0bG9jfTsKPiAKPiBzdGF0aWMgdm9pZCB2ZXJpZnlfdGltZV9zdG9yZSh1bnNpZ25lZCBp
bnQgaSkKPiB7Cj4gIMKgwqDCoCBURVNUKHRpbWUoYXJnc1tpXSkpOwo+ICDCoMKgwqDCoCAuLi4u
Li4KPiB9CgpJIHRoaW5rIHRoZXNlIHR3byBhcmUgZGlmZmVyZW50LgoKSW4gYHZlcmlmeV90aW1l
X3N0b3JlKClgLCB3ZSBjaGVjayB0aGUgcmV0dXJuIHZhbHVlIG9mIGB0aW1lKCZ0bG9jKWAgYW5k
IApqdWRnZSB3aGV0aGVyIGl0IGlzIGVxdWFsIHRvIHRoZSBhcmd1bWVudCBgdGxvY2AuICBCdXQg
aW4gCmB2ZXJpZnlfdGltZSgpYCwgdGhlIGp1ZGdtZW50IG9mIHdoZXRoZXIgdGhleSBhcmUgZXF1
YWwgb3Igbm90IGlzIG5vdCAKbmVjZXNzYXJ5LiAgU28sIEkgdGhpbmsgdGhlIHR3byBmdW5jdGlv
bnMgYXJlIG5lZWRlZCBiZWNhdXNlIG9mIHRoZSAKZGlmZmVyZW50IGxvZ2ljLgoKCi0tClRoYW5r
cywKUnVhbiBTaGl5YW5nLgoKPiAKPiBCZXN0IFJlZ2FyZHMsCj4gWGlhbyBZYW5nCj4+ICsKPj4g
K3N0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKPj4gK8KgwqDCoCAudGVzdCA9IHJ1biwK
Pj4gK8KgwqDCoCAudGNudCA9IEFSUkFZX1NJWkUodGNhc2VzKSwKPj4gK307CgoKCi0tIApNYWls
aW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
