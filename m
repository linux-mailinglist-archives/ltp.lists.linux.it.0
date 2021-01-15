Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEED2F7451
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 09:30:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 47B013C317E
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 09:30:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 462993C288F
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 09:30:03 +0100 (CET)
Received: from spam.asrmicro.com (asrmicro.com [210.13.118.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D78ED100022F
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 09:30:01 +0100 (CET)
Received: from exch02.asrmicro.com (exch02.asrmicro.com [10.1.24.122])
 by spam.asrmicro.com with ESMTPS id 10F8TbWm013557
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
 Fri, 15 Jan 2021 16:29:37 +0800 (GMT-8)
 (envelope-from meitaogao@asrmicro.com)
Received: from exch01.asrmicro.com (10.1.24.121) by exch02.asrmicro.com
 (10.1.24.122) with Microsoft SMTP Server (TLS) id 15.0.847.32; Fri, 15 Jan
 2021 16:29:40 +0800
Received: from exch01.asrmicro.com ([::1]) by exch01.asrmicro.com ([::1]) with
 mapi id 15.00.0847.030; Fri, 15 Jan 2021 16:29:40 +0800
From: =?utf-8?B?R2FvIE1laXRhb++8iOmrmOeOq+a2m++8iQ==?= <meitaogao@asrmicro.com>
To: Joerg Vehlow <lkml@jv-coder.de>, "ltp@lists.linux.it" <ltp@lists.linux.it>,
 Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] LTP testcase(sysctl02) failed
Thread-Index: AdbZuXpPNEiX/kccTjW4wmzi4oV72wRCR72AABViAyA=
Date: Fri, 15 Jan 2021 08:29:40 +0000
Message-ID: <57bd563d22b642ec8618fc4f45e2811e@exch01.asrmicro.com>
References: <0efaa481ffd24bc48fd41385159be66c@exch01.asrmicro.com>
 <f3136f18-edd5-08b7-a720-72baeeed7fbc@jv-coder.de>
In-Reply-To: <f3136f18-edd5-08b7-a720-72baeeed7fbc@jv-coder.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.170.170]
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: spam.asrmicro.com 10F8TbWm013557
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] =?utf-8?b?562U5aSNOiAgTFRQIHRlc3RjYXNlKHN5c2N0bDAyKSBmYWls?=
 =?utf-8?q?ed?=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgSm9lcnk6DQoNCglUaGFua3MgZm9yIHlvdXIgaW5mb3JtYXRpb24gYW5kIGNsZWFyaW5nIHRo
aXMgb3V0LCBBaCwgSSBhbSBub3QgYWxvbmUgd2l0aCB0aGlzLg0KCUFmdGVyIEkgY2hlY2tlZCB0
aGlzIHBhdGNoICg3ZjI5MjNjKSwgZm91bmQgdGhhdCBpdCBzZWVtIGJlIG5lY2Vzc2FyeSAsIHNv
IHBhdGNoIGl0IGludG8gbXkgY29kZWJhc2UuDQoNCg0KQmVzdCB3aXNoZXMuDQotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KQmVzdCBSZWdhcmRzDQpNZWl0YW8gR2FvDQowMjEt
NjEwOS0yOTk5IGV4dC4gODMwMA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQoNCg0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrlj5Hku7bkuro6IEpvZXJnIFZlaGxvdyBb
bWFpbHRvOmxrbWxAanYtY29kZXIuZGVdIA0K5Y+R6YCB5pe26Ze0OiAyMDIx5bm0MeaciDE15pel
IDE0OjE0DQrmlLbku7bkuro6IEdhbyBNZWl0YW/vvIjpq5jnjqvmtpvvvIk7IGx0cEBsaXN0cy5s
aW51eC5pdDsgQ3lyaWwgSHJ1YmlzDQrkuLvpopg6IFJlOiBbTFRQXSBMVFAgdGVzdGNhc2Uoc3lz
Y3RsMDIpIGZhaWxlZA0KDQpIaSBHYW8sDQoNCk9uIDEyLzI0LzIwMjAgNjo1NiBBTSwgR2FvIE1l
aXRhb++8iOmrmOeOq+a2m++8iSB3cm90ZToNCj4NCj4gYWZ0ZXIgaW52ZXN0aWdhdGVkIGl0LCB0
aGlzIHRlc3RjYXNlIGlzIGZvciBidWZmZmVyIG92ZXJmbG93LCBJIA0KPiBjaGVja2VkIHNvdXJj
ZSBjb2RlIChrZXJuZWwgNC4xOSksDQo+DQo+IGFsbCBvZiByZXF1aXJlZCBwYXRjaGVkIGhhZCBi
ZWVuIGFwcGxpZWQsIEkgZGlnIGludG8gaXQgYW5kIGZvdW5kIG5ldyANCj4gcGF0Y2ggYXBwbGll
ZCBhcyBmbG93ICwgdGhhdCBtaWdodCBtYWtlIHRlc3RjYXNlIGZhaWxlZA0KPg0KPiBzbyBpcyB0
aGlzIHRlc3RjYXNlIG91dCBvZiBkYXRlIG9yIHNvbWV0aGluZyB3cm9uZyB3aWggbXkga2VybmVs
ID8NCj4NCj4gd2hvIGNhbiBoZWxwIG1lIGZpZ3VyZSB0aGlzIG91dD8gVGhhbmtzIGluIGFkdmFu
Y2UuDQo+DQpJIGFsc28gc2F3IHRoaXMgb24gNC4xOS4gRnJvbSB0aGUgbWFpbGluZyBsaXN0IG9m
IHRoZSBrZXJuZWwsIGl0IGxvb2tzIGxpa2UgdGhlcmUgd2FzIHNvbWUgY29uZnVzaW9uIHdoZW4g
dGhleSBwb3J0ZWQgdGhlIHBhdGNoZXMgYmFjayB0byA0LjE5Lg0KSSBkbyBub3QgZmluZCB0aGUg
bWFpbHMgb24gdGhlIG1haWxpbmcgbGlzdCBhbnltb3JlLiBCdXQgdGhlIGNvbW1pdCA3ZjI5MjNj
IGZyb20gbWFzdGVyIGlzIG1pc3NpbmcgSUlSQy4NCkNocmlzdGlhbiBCcmF1bmVyIG1hZGUgdHdv
IGNoYW5nZXM6DQoxLiBQcmV2ZW50IG92ZXIgYW5kIHVuZGVyZmxvdyBieSBqdXN0IGtlZXBpbmcg
dGhlIG9sZCB2YWx1ZSAoN2YyOTIzYyB0b2dldGhlciB3aXRoIDMyYTVhZDljKS4gVGhpcyBpbnRy
b2R1Y2VkIGEga2FzYW4gYnVnIGZpeGVkIGluIDkwMDJiMjEgMi4gUmV0dXJuIEVJTlZBTCwgaWYg
YW4gb3ZlcmZsb3cgb3IgdW5kZXJmbG93IG9mIHRoZSBuZXcgdmFsdWUgaXMgZGV0ZWN0ZWQgKGUy
NjBhZDAxZikNCg0KIEZyb20gd2hhdCBJIHJlbWVtYmVyIENocmlzdGlhbiB3YW50ZWQgdGhlIGZp
cnN0IGNoYW5nZSBjb21wbGV0ZWx5IGJhY2twb3J0ZWQgdG8gNC4xOSAoN2YyOTIzYywgMzJhNWFk
OWMgYW5kIDkwMDJiMjEpIGFuZCBoZSB3YW50ZWQgdG8gb21pdCB0aGUgY2hhbmdlIGRvbmUgaW4g
ZTI2MGFkMDFmLCBiZWNhdXNlIHRoYXQgY2hhbmdlZCB0aGUgYmVoYXZpb3Igb2YgdGhlIGludGVy
ZmFjZSB0b3dhcmRzIHRoZSB1c2VyLg0KQnV0IHdoZW4gdGhlIGNoYW5nZWQgd2VyZSBiYWNrcG9y
dGVkIHRvIDQuMTksIHRoZSBjb21taXQgMzJhNWFkOWMsDQo5MDAyYjIxIGFuZCBlMjYwYWQwMWYg
d2VyZSBiYWNrcG9ydGVkLiBTaW5jZSA3ZjI5MjNjIGlzIHRoZSBjb21taXQsIHRoYXQgcmVhbGx5
IGVuYWJsZXMgb3Zlci0gYW5kIHVuZGVyZmxvdyBkZXRlY3Rpb24sIHRoaXMgaXMgbm90IGJhY2tw
b3J0ZWQgYW5kIGFsbCB0aGUgb3RoZXIgY29tbWl0IChpbmNsdWRpbmcgZTI2MGFkMDFmKSBoYXZl
IG5vIGVmZmVjdC4NCg0KQXQgdGhlIHRpbWUgSSBmb3VuZCB0aGlzLCBJIGhhZCBubyB0aW1lIHRv
IGZpbmQgb3V0IGhvdyBhbmQgd2hlcmUgdG8gcmVwb3J0IHRoaXMuDQpAQ3lyaWwgSSBndWVzcyB5
b3UgbWF5IGtub3cgaG93IGFuZCB3aG8gdG8gcmVwb3J0IHRoaXMgdG8/DQoNCkrDtnJnDQoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
