Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C4E15AA3C
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 14:43:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 218363C25DD
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 14:43:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 955A93C0428
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 14:43:14 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id B47FA201595
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 14:43:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581514992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xsfGRXk5ZQ8SQE6FXQVUQL8tf21Z9OvTaS4UdfgwJP0=;
 b=JPwm90WM6nS0X+gGxARv0ahjhCoQamL+D6lXYthtMw6wpLJHC0iX6jQeIThKDP+mZh56lB
 dTQMai4Qx5wKJUGeM5AzeVSQBJLX2DJN655/gL3e94HtbFi+fmfj6fz2o09sHcMOYC2wfn
 C4RVUfQC7ztnKQoelUbMdXiKEHb8dHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-0ZU-PY04OTyzrRKlVrk0hw-1; Wed, 12 Feb 2020 08:43:03 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33DA8190D342
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 13:43:02 +0000 (UTC)
Received: from localhost.localdomain (ovpn-121-160.rdu2.redhat.com
 [10.10.121.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4281119C6A;
 Wed, 12 Feb 2020 13:42:54 +0000 (UTC)
To: CKI Project <cki-project@redhat.com>, skt-results-master@redhat.com,
 jforbes@redhat.com, jcline@redhat.com
References: <cki.0.DS0DIXTWC0@redhat.com>
From: Rachel Sibley <rasibley@redhat.com>
Message-ID: <9929886b-3c37-9b9c-08d3-ee17cc6047c7@redhat.com>
Date: Wed, 12 Feb 2020 08:42:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <cki.0.DS0DIXTWC0@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 0ZU-PY04OTyzrRKlVrk0hw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E5?=
 =?utf-8?q?=2E3-200=2Efc31_=28fedora-31=29?=
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
Cc: Memory Management <mm-qe@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgpPbiAyLzEyLzIwIDc6NDcgQU0sIENLSSBQcm9qZWN0IHdyb3RlOgo+IEhlbGxvIGpmb3JiZXMs
Cj4gCj4gV2UgcmFuIGF1dG9tYXRlZCB0ZXN0cyBvbiBhIGtlcm5lbCBidWlsZCB0aGF0IHlvdSBz
ZW50IHRvIEtvamk6Cj4gCj4gICAgICBLZXJuZWwgcGFja2FnZToga2VybmVsLTUuNS4zLTIwMC5m
YzMxCj4gICAgICAgICAgIEtvamkgdGFzazogaHR0cHM6Ly9rb2ppLmZlZG9yYXByb2plY3Qub3Jn
L2tvamkvdGFza2luZm8/dGFza0lEPTQxNDYxMjgwCj4gCj4gVGhlIHJlc3VsdHMgb2YgdGhlc2Ug
YXV0b21hdGVkIHRlc3RzIGFyZSBwcm92aWRlZCBiZWxvdy4KPiAKPiAgICAgIE92ZXJhbGwgcmVz
dWx0OiBGQUlMRUQgKHNlZSBkZXRhaWxzIGJlbG93KQo+ICAgICAgICAgICAgICAgVGVzdHM6IEZB
SUxFRAo+IAo+IE9uZSBvciBtb3JlIGtlcm5lbCB0ZXN0cyBmYWlsZWQ6Cj4gCj4gICAgICBwcGM2
NGxlOgo+ICAgICAgIOKdjCBMVFAKCkZvciBzb21lIHJlYXNvbiB0aGUgbG9ncyB3ZXJlbid0IGRp
c3BsYXllZCwgc29ycnkgYWJvdXQgdGhhdCwgd2UnbGwgd29yayBvbiBmaXhpbmcgaXQuIFRoaXMg
d2FzCnJlbGF0ZWQgdG8gYSBmYWlsZWQgZG1lc2cgY2hlY2ssIG1vc3QgbGlrZWx5IGNhdXNlZCBm
cm9tIHJ1bm5pbmcgb24gYSBzbG93IGt2bSBndWVzdDoKClsxMzM4NC44MzM0MTldIHdhdGNoZG9n
OiBCVUc6IHNvZnQgbG9ja3VwIC0gQ1BVIzE1IHN0dWNrIGZvciAyM3MhIFtrd29ya2VyLzE1Ojc6
ODE4NzM0XQpbMTM4MDMuMTkzMzA4XSB3YXRjaGRvZzogQlVHOiBzb2Z0IGxvY2t1cCAtIENQVSM0
IHN0dWNrIGZvciA4MXMhIFtzeXN0ZW1kOjFdClsxMzg0OC4wMzYwNjVdIHdhdGNoZG9nOiBCVUc6
IHNvZnQgbG9ja3VwIC0gQ1BVIzQgc3R1Y2sgZm9yIDIycyEgW3N5c3RlbWQ6MV0KWzEzODc2LjM3
MzYwMF0gd2F0Y2hkb2c6IEJVRzogc29mdCBsb2NrdXAgLSBDUFUjMyBzdHVjayBmb3IgMjZzISBb
bWlncmF0aW9uLzM6MjVdClsxNDAzMS44OTMxNjRdIHdhdGNoZG9nOiBCVUc6IHNvZnQgbG9ja3Vw
IC0gQ1BVIzcgc3R1Y2sgZm9yIDU3cyEgW3N5c3RlbWQ6MV0KWzE0MDkxLjIyOTgxOV0gd2F0Y2hk
b2c6IEJVRzogc29mdCBsb2NrdXAgLSBDUFUjNSBzdHVjayBmb3IgMjlzISBbc3lzdGVtZDoxXQpb
MTQyNjIuMDEzNzMyXSB3YXRjaGRvZzogQlVHOiBzb2Z0IGxvY2t1cCAtIENQVSM3IHN0dWNrIGZv
ciA1N3MhIFtzeXN0ZW1kLWpvdXJuYWw6ODIwMTk3XQpbMTQyNjIuMDEzNzM0XSB3YXRjaGRvZzog
QlVHOiBzb2Z0IGxvY2t1cCAtIENQVSMyIHN0dWNrIGZvciAzOHMhIFtzeXN0ZW1kOjFdClsxNDM4
Mi42NTM5NTldIHdhdGNoZG9nOiBCVUc6IHNvZnQgbG9ja3VwIC0gQ1BVIzEwIHN0dWNrIGZvciAy
NHMhIFtzeXN0ZW1kOjFdCj4gCj4gCj4gICAgICBQaXBlbGluZTogaHR0cHM6Ly94Y2kzMi5sYWIu
ZW5nLnJkdTIucmVkaGF0LmNvbS9ja2ktcHJvamVjdC9icmV3LXBpcGVsaW5lL3BpcGVsaW5lcy80
MzI4MDYKPiAKPiBXZSBob3BlIHRoYXQgdGhlc2UgbG9ncyBjYW4gaGVscCB5b3UgZmluZCB0aGUg
cHJvYmxlbSBxdWlja2x5LiBGb3IgdGhlIGZ1bGwKPiBkZXRhaWwgb24gb3VyIHRlc3RpbmcgcHJv
Y2VkdXJlcywgcGxlYXNlIHNjcm9sbCB0byB0aGUgYm90dG9tIG9mIHRoaXMgbWVzc2FnZS4KPiAK
PiBQbGVhc2UgcmVwbHkgdG8gdGhpcyBlbWFpbCBpZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb25zIGFi
b3V0IHRoZSB0ZXN0cyB0aGF0IHdlCj4gcmFuIG9yIGlmIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9u
cyBvbiBob3cgdG8gbWFrZSBmdXR1cmUgdGVzdHMgbW9yZSBlZmZlY3RpdmUuCj4gCj4gICAgICAg
ICAgLC0uICAgLC0uCj4gICAgICAgICAoIEMgKSAoIEsgKSAgQ29udGludW91cwo+ICAgICAgICAg
IGAtJywtLmAtJyAgIEtlcm5lbAo+ICAgICAgICAgICAgKCBJICkgICAgIEludGVncmF0aW9uCj4g
ICAgICAgICAgICAgYC0nCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gCj4gSGFyZHdhcmUgdGVz
dGluZwo+IC0tLS0tLS0tLS0tLS0tLS0KPiBXZSBib290ZWQgZWFjaCBrZXJuZWwgYW5kIHJhbiB0
aGUgZm9sbG93aW5nIHRlc3RzOgo+IAo+ICAgIGFhcmNoNjQ6Cj4gICAgICBIb3N0IDE6Cj4gICAg
ICAgICDinIUgQm9vdCB0ZXN0Cj4gICAgICAgICDinIUgeGZzdGVzdHMgLSBleHQ0Cj4gICAgICAg
ICDinIUgeGZzdGVzdHMgLSB4ZnMKPiAgICAgICAgIOKchSBsdm0gdGhpbnAgc2FuaXR5Cj4gICAg
ICAgICDinIUgc3RyZXNzOiBzdHJlc3MtbmcKPiAgICAgICAgIPCfmqcg4pyFIFN0b3JhZ2UgYmxr
dGVzdHMKPiAKPiAgICAgIEhvc3QgMjoKPiAgICAgICAgIOKchSBCb290IHRlc3QKPiAgICAgICAg
IOKchSBMVFAKPiAgICAgICAgIOKchSBMb29wZGV2IFNhbml0eQo+ICAgICAgICAg4pyFIE1lbW9y
eSBmdW5jdGlvbjogbWVtZmRfY3JlYXRlCj4gICAgICAgICDinIUgQU1UVSAoQWJzdHJhY3QgTWFj
aGluZSBUZXN0IFV0aWxpdHkpCj4gICAgICAgICDinIUgRXRoZXJuZXQgZHJpdmVycyBzYW5pdHkK
PiAgICAgICAgIPCfmqcg4pyFIENJRlMgQ29ubmVjdGF0aG9uCj4gICAgICAgICDwn5qnIOKchSBM
VFA6IG9wZW5wb3NpeCB0ZXN0IHN1aXRlCj4gCj4gICAgcHBjNjRsZToKPiAgICAgIEhvc3QgMToK
PiAgICAgICAgIOKchSBCb290IHRlc3QKPiAgICAgICAgIOKchSB4ZnN0ZXN0cyAtIGV4dDQKPiAg
ICAgICAgIOKchSB4ZnN0ZXN0cyAtIHhmcwo+ICAgICAgICAg4pyFIGx2bSB0aGlucCBzYW5pdHkK
PiAgICAgICAgIPCfmqcg4pyFIFN0b3JhZ2UgYmxrdGVzdHMKPiAKPiAgICAgIEhvc3QgMjoKPiAg
ICAgICAgIOKchSBCb290IHRlc3QKPiAgICAgICAgIOKdjCBMVFAKPiAgICAgICAgIOKchSBMb29w
ZGV2IFNhbml0eQo+ICAgICAgICAg4pyFIE1lbW9yeSBmdW5jdGlvbjogbWVtZmRfY3JlYXRlCj4g
ICAgICAgICDinIUgQU1UVSAoQWJzdHJhY3QgTWFjaGluZSBUZXN0IFV0aWxpdHkpCj4gICAgICAg
ICDinIUgRXRoZXJuZXQgZHJpdmVycyBzYW5pdHkKPiAgICAgICAgIPCfmqcg4pyFIENJRlMgQ29u
bmVjdGF0aG9uCj4gICAgICAgICDwn5qnIOKchSBMVFA6IG9wZW5wb3NpeCB0ZXN0IHN1aXRlCj4g
Cj4gICAgeDg2XzY0Ogo+ICAgICAgSG9zdCAxOgo+ICAgICAgICAg4pyFIEJvb3QgdGVzdAo+ICAg
ICAgICAg4pyFIHhmc3Rlc3RzIC0gZXh0NAo+ICAgICAgICAg4pyFIHhmc3Rlc3RzIC0geGZzCj4g
ICAgICAgICDinIUgbHZtIHRoaW5wIHNhbml0eQo+ICAgICAgICAg4pyFIHN0cmVzczogc3RyZXNz
LW5nCj4gICAgICAgICDwn5qnIOKchSBTdG9yYWdlIGJsa3Rlc3RzCj4gCj4gICAgICBIb3N0IDI6
Cj4gICAgICAgICDinIUgQm9vdCB0ZXN0Cj4gICAgICAgICDinIUgTFRQCj4gICAgICAgICDinIUg
TG9vcGRldiBTYW5pdHkKPiAgICAgICAgIOKchSBNZW1vcnkgZnVuY3Rpb246IG1lbWZkX2NyZWF0
ZQo+ICAgICAgICAg4pyFIEFNVFUgKEFic3RyYWN0IE1hY2hpbmUgVGVzdCBVdGlsaXR5KQo+ICAg
ICAgICAg4pyFIEV0aGVybmV0IGRyaXZlcnMgc2FuaXR5Cj4gICAgICAgICDwn5qnIOKchSBDSUZT
IENvbm5lY3RhdGhvbgo+ICAgICAgICAg8J+apyDinIUgTFRQOiBvcGVucG9zaXggdGVzdCBzdWl0
ZQo+IAo+ICAgIFRlc3Qgc291cmNlczogaHR0cHM6Ly9naXRodWIuY29tL0NLSS1wcm9qZWN0L3Rl
c3RzLWJlYWtlcgo+ICAgICAg8J+SmiBQdWxsIHJlcXVlc3RzIGFyZSB3ZWxjb21lIGZvciBuZXcg
dGVzdHMgb3IgaW1wcm92ZW1lbnRzIHRvIGV4aXN0aW5nIHRlc3RzIQo+IAo+IFdhaXZlZCB0ZXN0
cwo+IC0tLS0tLS0tLS0tLQo+IElmIHRoZSB0ZXN0IHJ1biBpbmNsdWRlZCB3YWl2ZWQgdGVzdHMs
IHRoZXkgYXJlIG1hcmtlZCB3aXRoIPCfmqcuIFN1Y2ggdGVzdHMgYXJlCj4gZXhlY3V0ZWQgYnV0
IHRoZWlyIHJlc3VsdHMgYXJlIG5vdCB0YWtlbiBpbnRvIGFjY291bnQuIFRlc3RzIGFyZSB3YWl2
ZWQgd2hlbgo+IHRoZWlyIHJlc3VsdHMgYXJlIG5vdCByZWxpYWJsZSBlbm91Z2gsIGUuZy4gd2hl
biB0aGV5J3JlIGp1c3QgaW50cm9kdWNlZCBvciBhcmUKPiBiZWluZyBmaXhlZC4KPiAKPiBUZXN0
aW5nIHRpbWVvdXQKPiAtLS0tLS0tLS0tLS0tLS0KPiBXZSBhaW0gdG8gcHJvdmlkZSBhIHJlcG9y
dCB3aXRoaW4gcmVhc29uYWJsZSB0aW1lZnJhbWUuIFRlc3RzIHRoYXQgaGF2ZW4ndAo+IGZpbmlz
aGVkIHJ1bm5pbmcgYXJlIG1hcmtlZCB3aXRoIOKPsS4gUmVwb3J0cyBmb3Igbm9uLXVwc3RyZWFt
IGtlcm5lbHMgaGF2ZQo+IGEgQmVha2VyIHJlY2lwZSBsaW5rZWQgdG8gbmV4dCB0byBlYWNoIGhv
c3QuCj4gCj4gCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0
L2xpc3RpbmZvL2x0cAo=
