Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1BA188BB9
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 18:12:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1BF273C5608
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 18:12:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 6AE803C04FD
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 18:11:58 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 455F41A0152E
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 18:11:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584465115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=247/teCd/vfmc+cZBfW10f89ThAB0tLidOPGNHN8l6M=;
 b=bd29OM0iPCeMApuUIS+qyTObDm5Nw52D79xP55jN8PC0JXokIOJXiSmTEtoIIr/rbdAwKX
 6cdZ9wsVSahsDYDmYwwUqTyzHqShSjiMxheRZ7JWZ4JKFalGmWzZejVqmgZpq5EzoDP37U
 /942EnkD+3ZafdZQJrhZVL+Cu74RN2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-xfvRDxQxMC-k6RfVluiNGA-1; Tue, 17 Mar 2020 13:11:49 -0400
X-MC-Unique: xfvRDxQxMC-k6RfVluiNGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BB7D19667AB;
 Tue, 17 Mar 2020 17:10:43 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-136.rdu2.redhat.com
 [10.10.112.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCFEA7E33B;
 Tue, 17 Mar 2020 17:10:28 +0000 (UTC)
To: CKI Project <cki-project@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>
References: <cki.45BE8D2AEE.EDVG8CXFLJ@redhat.com>
From: Rachel Sibley <rasibley@redhat.com>
Message-ID: <4f7fbcf7-6168-8b07-9f2f-e1a17a502000@redhat.com>
Date: Tue, 17 Mar 2020 13:10:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <cki.45BE8D2AEE.EDVG8CXFLJ@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E5?=
 =?utf-8?q?=2E10-rc1-97969bd=2Ecki_=28stable=29?=
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
Cc: Ondrej Moris <omoris@redhat.com>, Memory Management <mm-qe@redhat.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgpPbiAzLzE3LzIwIDEyOjM4IFBNLCBDS0kgUHJvamVjdCB3cm90ZToKPiAKPiBIZWxsbywKPiAK
PiBXZSByYW4gYXV0b21hdGVkIHRlc3RzIG9uIGEgcmVjZW50IGNvbW1pdCBmcm9tIHRoaXMga2Vy
bmVsIHRyZWU6Cj4gCj4gICAgICAgICBLZXJuZWwgcmVwbzogaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0YWJsZS1yYy5naXQKPiAg
ICAgICAgICAgICAgQ29tbWl0OiA5Nzk2OWJkMTcwMDkgLSBMaW51eCA1LjUuMTAtcmMxCj4gCj4g
VGhlIHJlc3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBwcm92aWRlZCBiZWxvdy4K
PiAKPiAgICAgIE92ZXJhbGwgcmVzdWx0OiBGQUlMRUQgKHNlZSBkZXRhaWxzIGJlbG93KQo+ICAg
ICAgICAgICAgICAgTWVyZ2U6IE9LCj4gICAgICAgICAgICAgQ29tcGlsZTogT0sKPiAgICAgICAg
ICAgICAgIFRlc3RzOiBGQUlMRUQKPiAKPiBBbGwga2VybmVsIGJpbmFyaWVzLCBjb25maWcgZmls
ZXMsIGFuZCBsb2dzIGFyZSBhdmFpbGFibGUgZm9yIGRvd25sb2FkIGhlcmU6Cj4gCj4gICAgaHR0
cHM6Ly9ja2ktYXJ0aWZhY3RzLnMzLnVzLWVhc3QtMi5hbWF6b25hd3MuY29tL2luZGV4Lmh0bWw/
cHJlZml4PWRhdGF3YXJlaG91c2UvMjAyMC8wMy8xNy80OTI2NTcKPiAKPiBPbmUgb3IgbW9yZSBr
ZXJuZWwgdGVzdHMgZmFpbGVkOgo+IAo+ICAgICAgcHBjNjRsZToKPiAgICAgICDinYwgTFRQCj4g
CgpUaGUgZG1lc2cgY2hlY2sgZmFpbGVkIGR1cmluZyBMVFAsIG1vc3QgbGlrZWx5IGR1ZSB0byBy
dW5uaW5nIG9uIGEgc2xvdyBrdm0gZ3Vlc3Q6CgpbIDcwMDYuMjU5NDY3XSB3YXRjaGRvZzogQlVH
OiBzb2Z0IGxvY2t1cCAtIENQVSMyIHN0dWNrIGZvciAyMXMhIFtkaW90ZXN0Njo4MTg4NDFdClsg
NzEzOC4wMDcwMjNdIHdhdGNoZG9nOiBCVUc6IHNvZnQgbG9ja3VwIC0gQ1BVIzggc3R1Y2sgZm9y
IDM4cyEgW3N5c3RlbWQtam91cm5hbDo1NjFdCgoKPiBXZSBob3BlIHRoYXQgdGhlc2UgbG9ncyBj
YW4gaGVscCB5b3UgZmluZCB0aGUgcHJvYmxlbSBxdWlja2x5LiBGb3IgdGhlIGZ1bGwKPiBkZXRh
aWwgb24gb3VyIHRlc3RpbmcgcHJvY2VkdXJlcywgcGxlYXNlIHNjcm9sbCB0byB0aGUgYm90dG9t
IG9mIHRoaXMgbWVzc2FnZS4KPiAKPiBQbGVhc2UgcmVwbHkgdG8gdGhpcyBlbWFpbCBpZiB5b3Ug
aGF2ZSBhbnkgcXVlc3Rpb25zIGFib3V0IHRoZSB0ZXN0cyB0aGF0IHdlCj4gcmFuIG9yIGlmIHlv
dSBoYXZlIGFueSBzdWdnZXN0aW9ucyBvbiBob3cgdG8gbWFrZSBmdXR1cmUgdGVzdHMgbW9yZSBl
ZmZlY3RpdmUuCj4gCj4gICAgICAgICAgLC0uICAgLC0uCj4gICAgICAgICAoIEMgKSAoIEsgKSAg
Q29udGludW91cwo+ICAgICAgICAgIGAtJywtLmAtJyAgIEtlcm5lbAo+ICAgICAgICAgICAgKCBJ
ICkgICAgIEludGVncmF0aW9uCj4gICAgICAgICAgICAgYC0nCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gCj4gQ29tcGlsZSB0ZXN0aW5nCj4gLS0tLS0tLS0tLS0tLS0tCj4gCj4gV2UgY29tcGls
ZWQgdGhlIGtlcm5lbCBmb3IgNCBhcmNoaXRlY3R1cmVzOgo+IAo+ICAgICAgYWFyY2g2NDoKPiAg
ICAgICAgbWFrZSBvcHRpb25zOiAtajMwIElOU1RBTExfTU9EX1NUUklQPTEgdGFyZ3otcGtnCj4g
Cj4gICAgICBwcGM2NGxlOgo+ICAgICAgICBtYWtlIG9wdGlvbnM6IC1qMzAgSU5TVEFMTF9NT0Rf
U1RSSVA9MSB0YXJnei1wa2cKPiAKPiAgICAgIHMzOTB4Ogo+ICAgICAgICBtYWtlIG9wdGlvbnM6
IC1qMzAgSU5TVEFMTF9NT0RfU1RSSVA9MSB0YXJnei1wa2cKPiAKPiAgICAgIHg4Nl82NDoKPiAg
ICAgICAgbWFrZSBvcHRpb25zOiAtajMwIElOU1RBTExfTU9EX1NUUklQPTEgdGFyZ3otcGtnCj4g
Cj4gCj4gSGFyZHdhcmUgdGVzdGluZwo+IC0tLS0tLS0tLS0tLS0tLS0KPiBXZSBib290ZWQgZWFj
aCBrZXJuZWwgYW5kIHJhbiB0aGUgZm9sbG93aW5nIHRlc3RzOgo+IAo+ICAgIGFhcmNoNjQ6Cj4g
ICAgICBIb3N0IDE6Cj4gICAgICAgICDinIUgQm9vdCB0ZXN0Cj4gICAgICAgICDinIUgeGZzdGVz
dHMgLSBleHQ0Cj4gICAgICAgICDinIUgeGZzdGVzdHMgLSB4ZnMKPiAgICAgICAgIOKchSBsdm0g
dGhpbnAgc2FuaXR5Cj4gICAgICAgICDinIUgc3RvcmFnZTogc29mdHdhcmUgUkFJRCB0ZXN0aW5n
Cj4gICAgICAgICDwn5qnIOKchSBzZWxpbnV4LXBvbGljeTogc2VyZ2UtdGVzdHN1aXRlCj4gICAg
ICAgICDwn5qnIOKchSBTdG9yYWdlIGJsa3Rlc3RzCj4gCj4gICAgICBIb3N0IDI6Cj4gICAgICAg
ICDinIUgQm9vdCB0ZXN0Cj4gICAgICAgICDinIUgUG9kbWFuIHN5c3RlbSBpbnRlZ3JhdGlvbiB0
ZXN0IC0gYXMgcm9vdAo+ICAgICAgICAg4pyFIFBvZG1hbiBzeXN0ZW0gaW50ZWdyYXRpb24gdGVz
dCAtIGFzIHVzZXIKPiAgICAgICAgIOKchSBMVFAKPiAgICAgICAgIOKchSBMb29wZGV2IFNhbml0
eQo+ICAgICAgICAg4pyFIE1lbW9yeSBmdW5jdGlvbjogbWVtZmRfY3JlYXRlCj4gICAgICAgICDi
nIUgQU1UVSAoQWJzdHJhY3QgTWFjaGluZSBUZXN0IFV0aWxpdHkpCj4gICAgICAgICDinIUgTmV0
d29ya2luZyBicmlkZ2U6IHNhbml0eQo+ICAgICAgICAg4pyFIEV0aGVybmV0IGRyaXZlcnMgc2Fu
aXR5Cj4gICAgICAgICDinIUgTmV0d29ya2luZyBNQUNzZWM6IHNhbml0eQo+ICAgICAgICAg4pyF
IE5ldHdvcmtpbmcgc29ja2V0OiBmdXp6Cj4gICAgICAgICDinIUgTmV0d29ya2luZyBzY3RwLWF1
dGg6IHNvY2tvcHRzIHRlc3QKPiAgICAgICAgIOKchSBOZXR3b3JraW5nOiBpZ21wIGNvbmZvcm1h
bmNlIHRlc3QKPiAgICAgICAgIOKchSBOZXR3b3JraW5nIHJvdXRlOiBwbXR1Cj4gICAgICAgICDi
nIUgTmV0d29ya2luZyByb3V0ZV9mdW5jIC0gbG9jYWwKPiAgICAgICAgIOKchSBOZXR3b3JraW5n
IHJvdXRlX2Z1bmMgLSBmb3J3YXJkCj4gICAgICAgICDinIUgTmV0d29ya2luZyBUQ1A6IGtlZXBh
bGl2ZSB0ZXN0Cj4gICAgICAgICDinIUgTmV0d29ya2luZyBVRFA6IHNvY2tldAo+ICAgICAgICAg
4pyFIE5ldHdvcmtpbmcgdHVubmVsOiBnZW5ldmUgYmFzaWMgdGVzdAo+ICAgICAgICAg4pyFIE5l
dHdvcmtpbmcgdHVubmVsOiBncmUgYmFzaWMKPiAgICAgICAgIOKchSBMMlRQIGJhc2ljIHRlc3QK
PiAgICAgICAgIOKchSBOZXR3b3JraW5nIHR1bm5lbDogdnhsYW4gYmFzaWMKPiAgICAgICAgIOKc
hSBOZXR3b3JraW5nIGlwc2VjOiBiYXNpYyBuZXRucyAtIHRyYW5zcG9ydAo+ICAgICAgICAg4pyF
IE5ldHdvcmtpbmcgaXBzZWM6IGJhc2ljIG5ldG5zIC0gdHVubmVsCj4gICAgICAgICDinIUgaHR0
cGQ6IG1vZF9zc2wgc21va2Ugc2FuaXR5Cj4gICAgICAgICDinIUgdHVuZWQ6IHR1bmUtcHJvY2Vz
c2VzLXRocm91Z2gtcGVyZgo+ICAgICAgICAg4pyFIEFMU0EgUENNIGxvb3BiYWNrIHRlc3QKPiAg
ICAgICAgIOKchSBBTFNBIENvbnRyb2wgKG1peGVyKSBVc2Vyc3BhY2UgRWxlbWVudCB0ZXN0Cj4g
ICAgICAgICDinIUgc3RvcmFnZTogU0NTSSBWUEQKPiAgICAgICAgIOKchSB0cmFjZTogZnRyYWNl
L3RyYWNlcgo+ICAgICAgICAg8J+apyDinIUgQ0lGUyBDb25uZWN0YXRob24KPiAgICAgICAgIPCf
mqcg4pyFIFBPU0lYIHBqZC1mc3Rlc3Qgc3VpdGVzCj4gICAgICAgICDwn5qnIOKchSBqdm0gLSBE
YUNhcG8gQmVuY2htYXJrIFN1aXRlCj4gICAgICAgICDwn5qnIOKchSBqdm0gLSBqY3N0cmVzcyB0
ZXN0cwo+ICAgICAgICAg8J+apyDinIUgTWVtb3J5IGZ1bmN0aW9uOiBrYXNscgo+ICAgICAgICAg
8J+apyDinIUgTFRQOiBvcGVucG9zaXggdGVzdCBzdWl0ZQo+ICAgICAgICAg8J+apyDinIUgTmV0
d29ya2luZyB2bmljOiBpcHZsYW4vYmFzaWMKPiAgICAgICAgIPCfmqcg4p2MIGF1ZGl0OiBhdWRp
dCB0ZXN0c3VpdGUgdGVzdAo+ICAgICAgICAg8J+apyDinIUgaW90b3A6IHNhbml0eQo+ICAgICAg
ICAg8J+apyDinIUgVXNleCAtIHZlcnNpb24gMS45LTI5Cj4gICAgICAgICDwn5qnIOKchSBzdG9y
YWdlOiBkbS9jb21tb24KPiAKPiAgICBwcGM2NGxlOgo+ICAgICAgSG9zdCAxOgo+ICAgICAgICAg
4pyFIEJvb3QgdGVzdAo+ICAgICAgICAg4pyFIFBvZG1hbiBzeXN0ZW0gaW50ZWdyYXRpb24gdGVz
dCAtIGFzIHJvb3QKPiAgICAgICAgIOKchSBQb2RtYW4gc3lzdGVtIGludGVncmF0aW9uIHRlc3Qg
LSBhcyB1c2VyCj4gICAgICAgICDinYwgTFRQCj4gICAgICAgICDinIUgTG9vcGRldiBTYW5pdHkK
PiAgICAgICAgIOKchSBNZW1vcnkgZnVuY3Rpb246IG1lbWZkX2NyZWF0ZQo+ICAgICAgICAg4pyF
IEFNVFUgKEFic3RyYWN0IE1hY2hpbmUgVGVzdCBVdGlsaXR5KQo+ICAgICAgICAg4pyFIE5ldHdv
cmtpbmcgYnJpZGdlOiBzYW5pdHkKPiAgICAgICAgIOKchSBFdGhlcm5ldCBkcml2ZXJzIHNhbml0
eQo+ICAgICAgICAg4pyFIE5ldHdvcmtpbmcgTUFDc2VjOiBzYW5pdHkKPiAgICAgICAgIOKchSBO
ZXR3b3JraW5nIHNvY2tldDogZnV6ego+ICAgICAgICAg4pyFIE5ldHdvcmtpbmcgc2N0cC1hdXRo
OiBzb2Nrb3B0cyB0ZXN0Cj4gICAgICAgICDinIUgTmV0d29ya2luZyByb3V0ZTogcG10dQo+ICAg
ICAgICAg4pyFIE5ldHdvcmtpbmcgcm91dGVfZnVuYyAtIGxvY2FsCj4gICAgICAgICDinIUgTmV0
d29ya2luZyByb3V0ZV9mdW5jIC0gZm9yd2FyZAo+ICAgICAgICAg4pyFIE5ldHdvcmtpbmcgVENQ
OiBrZWVwYWxpdmUgdGVzdAo+ICAgICAgICAg4pyFIE5ldHdvcmtpbmcgVURQOiBzb2NrZXQKPiAg
ICAgICAgIOKchSBOZXR3b3JraW5nIHR1bm5lbDogZ2VuZXZlIGJhc2ljIHRlc3QKPiAgICAgICAg
IOKchSBOZXR3b3JraW5nIHR1bm5lbDogZ3JlIGJhc2ljCj4gICAgICAgICDinIUgTDJUUCBiYXNp
YyB0ZXN0Cj4gICAgICAgICDinIUgTmV0d29ya2luZyB0dW5uZWw6IHZ4bGFuIGJhc2ljCj4gICAg
ICAgICDinIUgTmV0d29ya2luZyBpcHNlYzogYmFzaWMgbmV0bnMgLSB0dW5uZWwKPiAgICAgICAg
IOKchSBodHRwZDogbW9kX3NzbCBzbW9rZSBzYW5pdHkKPiAgICAgICAgIOKchSB0dW5lZDogdHVu
ZS1wcm9jZXNzZXMtdGhyb3VnaC1wZXJmCj4gICAgICAgICDinIUgQUxTQSBQQ00gbG9vcGJhY2sg
dGVzdAo+ICAgICAgICAg4pyFIEFMU0EgQ29udHJvbCAobWl4ZXIpIFVzZXJzcGFjZSBFbGVtZW50
IHRlc3QKPiAgICAgICAgIOKchSB0cmFjZTogZnRyYWNlL3RyYWNlcgo+ICAgICAgICAg8J+apyDi
nIUgQ0lGUyBDb25uZWN0YXRob24KPiAgICAgICAgIPCfmqcg4pyFIFBPU0lYIHBqZC1mc3Rlc3Qg
c3VpdGVzCj4gICAgICAgICDwn5qnIOKchSBqdm0gLSBEYUNhcG8gQmVuY2htYXJrIFN1aXRlCj4g
ICAgICAgICDwn5qnIOKchSBqdm0gLSBqY3N0cmVzcyB0ZXN0cwo+ICAgICAgICAg8J+apyDinIUg
TWVtb3J5IGZ1bmN0aW9uOiBrYXNscgo+ICAgICAgICAg8J+apyDinIUgTFRQOiBvcGVucG9zaXgg
dGVzdCBzdWl0ZQo+ICAgICAgICAg8J+apyDinIUgTmV0d29ya2luZyB2bmljOiBpcHZsYW4vYmFz
aWMKPiAgICAgICAgIPCfmqcg4p2MIGF1ZGl0OiBhdWRpdCB0ZXN0c3VpdGUgdGVzdAo+ICAgICAg
ICAg8J+apyDinIUgaW90b3A6IHNhbml0eQo+ICAgICAgICAg8J+apyDinIUgVXNleCAtIHZlcnNp
b24gMS45LTI5Cj4gICAgICAgICDwn5qnIOKchSBzdG9yYWdlOiBkbS9jb21tb24KPiAKPiAgICAg
IEhvc3QgMjoKPiAgICAgICAgIOKchSBCb290IHRlc3QKPiAgICAgICAgIOKchSB4ZnN0ZXN0cyAt
IGV4dDQKPiAgICAgICAgIOKchSB4ZnN0ZXN0cyAtIHhmcwo+ICAgICAgICAg4pyFIGx2bSB0aGlu
cCBzYW5pdHkKPiAgICAgICAgIOKchSBzdG9yYWdlOiBzb2Z0d2FyZSBSQUlEIHRlc3RpbmcKPiAg
ICAgICAgIPCfmqcg4pyFIElQTUkgZHJpdmVyIHRlc3QKPiAgICAgICAgIPCfmqcg4pyFIElQTUl0
b29sIGxvb3Agc3RyZXNzIHRlc3QKPiAgICAgICAgIPCfmqcg4pyFIHNlbGludXgtcG9saWN5OiBz
ZXJnZS10ZXN0c3VpdGUKPiAgICAgICAgIPCfmqcg4pyFIFN0b3JhZ2UgYmxrdGVzdHMKPiAKPiAg
ICBzMzkweDoKPiAgICAgIEhvc3QgMToKPiAgICAgICAgIOKchSBCb290IHRlc3QKPiAgICAgICAg
IOKchSBQb2RtYW4gc3lzdGVtIGludGVncmF0aW9uIHRlc3QgLSBhcyByb290Cj4gICAgICAgICDi
nIUgUG9kbWFuIHN5c3RlbSBpbnRlZ3JhdGlvbiB0ZXN0IC0gYXMgdXNlcgo+ICAgICAgICAg4pyF
IExvb3BkZXYgU2FuaXR5Cj4gICAgICAgICDinIUgTWVtb3J5IGZ1bmN0aW9uOiBtZW1mZF9jcmVh
dGUKPiAgICAgICAgIOKchSBOZXR3b3JraW5nIGJyaWRnZTogc2FuaXR5Cj4gICAgICAgICDinIUg
RXRoZXJuZXQgZHJpdmVycyBzYW5pdHkKPiAgICAgICAgIOKchSBOZXR3b3JraW5nIE1BQ3NlYzog
c2FuaXR5Cj4gICAgICAgICDinIUgTmV0d29ya2luZyBzY3RwLWF1dGg6IHNvY2tvcHRzIHRlc3QK
PiAgICAgICAgIOKchSBOZXR3b3JraW5nIHJvdXRlOiBwbXR1Cj4gICAgICAgICDinIUgTmV0d29y
a2luZyByb3V0ZV9mdW5jIC0gbG9jYWwKPiAgICAgICAgIOKchSBOZXR3b3JraW5nIHJvdXRlX2Z1
bmMgLSBmb3J3YXJkCj4gICAgICAgICDinIUgTmV0d29ya2luZyBUQ1A6IGtlZXBhbGl2ZSB0ZXN0
Cj4gICAgICAgICDinIUgTmV0d29ya2luZyBVRFA6IHNvY2tldAo+ICAgICAgICAg4pyFIE5ldHdv
cmtpbmcgdHVubmVsOiBnZW5ldmUgYmFzaWMgdGVzdAo+ICAgICAgICAg4pyFIE5ldHdvcmtpbmcg
dHVubmVsOiBncmUgYmFzaWMKPiAgICAgICAgIOKchSBMMlRQIGJhc2ljIHRlc3QKPiAgICAgICAg
IOKchSBOZXR3b3JraW5nIHR1bm5lbDogdnhsYW4gYmFzaWMKPiAgICAgICAgIOKchSBOZXR3b3Jr
aW5nIGlwc2VjOiBiYXNpYyBuZXRucyAtIHRyYW5zcG9ydAo+ICAgICAgICAg4pyFIE5ldHdvcmtp
bmcgaXBzZWM6IGJhc2ljIG5ldG5zIC0gdHVubmVsCj4gICAgICAgICDinIUgaHR0cGQ6IG1vZF9z
c2wgc21va2Ugc2FuaXR5Cj4gICAgICAgICDinIUgdHVuZWQ6IHR1bmUtcHJvY2Vzc2VzLXRocm91
Z2gtcGVyZgo+ICAgICAgICAg4pyFIHRyYWNlOiBmdHJhY2UvdHJhY2VyCj4gICAgICAgICDwn5qn
IOKchSBDSUZTIENvbm5lY3RhdGhvbgo+ICAgICAgICAg8J+apyDinIUgUE9TSVggcGpkLWZzdGVz
dCBzdWl0ZXMKPiAgICAgICAgIPCfmqcg4pyFIGp2bSAtIERhQ2FwbyBCZW5jaG1hcmsgU3VpdGUK
PiAgICAgICAgIPCfmqcg4pyFIGp2bSAtIGpjc3RyZXNzIHRlc3RzCj4gICAgICAgICDwn5qnIOKc
hSBNZW1vcnkgZnVuY3Rpb246IGthc2xyCj4gICAgICAgICDwn5qnIOKchSBMVFA6IG9wZW5wb3Np
eCB0ZXN0IHN1aXRlCj4gICAgICAgICDwn5qnIOKchSBOZXR3b3JraW5nIHZuaWM6IGlwdmxhbi9i
YXNpYwo+ICAgICAgICAg8J+apyDinYwgYXVkaXQ6IGF1ZGl0IHRlc3RzdWl0ZSB0ZXN0Cj4gICAg
ICAgICDwn5qnIOKchSBpb3RvcDogc2FuaXR5Cj4gICAgICAgICDwn5qnIOKchSBzdG9yYWdlOiBk
bS9jb21tb24KPiAKPiAgICAgIEhvc3QgMjoKPiAgICAgICAgIOKchSBCb290IHRlc3QKPiAgICAg
ICAgIPCfmqcg4pyFIHNlbGludXgtcG9saWN5OiBzZXJnZS10ZXN0c3VpdGUKPiAgICAgICAgIPCf
mqcg4pyFIFN0b3JhZ2UgYmxrdGVzdHMKPiAKPiAgICB4ODZfNjQ6Cj4gICAgICBIb3N0IDE6Cj4g
ICAgICAgICDinIUgQm9vdCB0ZXN0Cj4gICAgICAgICDinIUgU3RvcmFnZSBTQU4gZGV2aWNlIHN0
cmVzcyAtIG1wdDNzYXMgZHJpdmVyCj4gCj4gICAgICBIb3N0IDI6Cj4gICAgICAgICDinIUgQm9v
dCB0ZXN0Cj4gICAgICAgICDinIUgeGZzdGVzdHMgLSBleHQ0Cj4gICAgICAgICDinIUgeGZzdGVz
dHMgLSB4ZnMKPiAgICAgICAgIOKchSBsdm0gdGhpbnAgc2FuaXR5Cj4gICAgICAgICDinIUgc3Rv
cmFnZTogc29mdHdhcmUgUkFJRCB0ZXN0aW5nCj4gICAgICAgICDinIUgc3RyZXNzOiBzdHJlc3Mt
bmcKPiAgICAgICAgIPCfmqcg4pyFIElPTU1VIGJvb3QgdGVzdAo+ICAgICAgICAg8J+apyDinIUg
SVBNSSBkcml2ZXIgdGVzdAo+ICAgICAgICAg8J+apyDinIUgSVBNSXRvb2wgbG9vcCBzdHJlc3Mg
dGVzdAo+ICAgICAgICAg8J+apyDinIUgc2VsaW51eC1wb2xpY3k6IHNlcmdlLXRlc3RzdWl0ZQo+
ICAgICAgICAg8J+apyDinIUgU3RvcmFnZSBibGt0ZXN0cwo+IAo+ICAgICAgSG9zdCAzOgo+ICAg
ICAgICAg4pyFIEJvb3QgdGVzdAo+ICAgICAgICAg4pyFIFN0b3JhZ2UgU0FOIGRldmljZSBzdHJl
c3MgLSBtZWdhcmFpZF9zYXMKPiAKPiAgICAgIEhvc3QgNDoKPiAgICAgICAgIOKchSBCb290IHRl
c3QKPiAgICAgICAgIOKchSBQb2RtYW4gc3lzdGVtIGludGVncmF0aW9uIHRlc3QgLSBhcyByb290
Cj4gICAgICAgICDinIUgUG9kbWFuIHN5c3RlbSBpbnRlZ3JhdGlvbiB0ZXN0IC0gYXMgdXNlcgo+
ICAgICAgICAg4pyFIExUUAo+ICAgICAgICAg4pyFIExvb3BkZXYgU2FuaXR5Cj4gICAgICAgICDi
nIUgTWVtb3J5IGZ1bmN0aW9uOiBtZW1mZF9jcmVhdGUKPiAgICAgICAgIOKchSBBTVRVIChBYnN0
cmFjdCBNYWNoaW5lIFRlc3QgVXRpbGl0eSkKPiAgICAgICAgIOKchSBOZXR3b3JraW5nIGJyaWRn
ZTogc2FuaXR5Cj4gICAgICAgICDinIUgRXRoZXJuZXQgZHJpdmVycyBzYW5pdHkKPiAgICAgICAg
IOKchSBOZXR3b3JraW5nIE1BQ3NlYzogc2FuaXR5Cj4gICAgICAgICDinIUgTmV0d29ya2luZyBz
b2NrZXQ6IGZ1enoKPiAgICAgICAgIOKchSBOZXR3b3JraW5nIHNjdHAtYXV0aDogc29ja29wdHMg
dGVzdAo+ICAgICAgICAg4pyFIE5ldHdvcmtpbmc6IGlnbXAgY29uZm9ybWFuY2UgdGVzdAo+ICAg
ICAgICAg4pyFIE5ldHdvcmtpbmcgcm91dGU6IHBtdHUKPiAgICAgICAgIOKchSBOZXR3b3JraW5n
IHJvdXRlX2Z1bmMgLSBsb2NhbAo+ICAgICAgICAg4pyFIE5ldHdvcmtpbmcgcm91dGVfZnVuYyAt
IGZvcndhcmQKPiAgICAgICAgIOKchSBOZXR3b3JraW5nIFRDUDoga2VlcGFsaXZlIHRlc3QKPiAg
ICAgICAgIOKchSBOZXR3b3JraW5nIFVEUDogc29ja2V0Cj4gICAgICAgICDinIUgTmV0d29ya2lu
ZyB0dW5uZWw6IGdlbmV2ZSBiYXNpYyB0ZXN0Cj4gICAgICAgICDinIUgTmV0d29ya2luZyB0dW5u
ZWw6IGdyZSBiYXNpYwo+ICAgICAgICAg4pyFIEwyVFAgYmFzaWMgdGVzdAo+ICAgICAgICAg4pyF
IE5ldHdvcmtpbmcgdHVubmVsOiB2eGxhbiBiYXNpYwo+ICAgICAgICAg4pyFIE5ldHdvcmtpbmcg
aXBzZWM6IGJhc2ljIG5ldG5zIC0gdHJhbnNwb3J0Cj4gICAgICAgICDinIUgTmV0d29ya2luZyBp
cHNlYzogYmFzaWMgbmV0bnMgLSB0dW5uZWwKPiAgICAgICAgIOKchSBodHRwZDogbW9kX3NzbCBz
bW9rZSBzYW5pdHkKPiAgICAgICAgIOKchSB0dW5lZDogdHVuZS1wcm9jZXNzZXMtdGhyb3VnaC1w
ZXJmCj4gICAgICAgICDinIUgcGNpdXRpbHM6IHNhbml0eSBzbW9rZSB0ZXN0Cj4gICAgICAgICDi
nIUgQUxTQSBQQ00gbG9vcGJhY2sgdGVzdAo+ICAgICAgICAg4pyFIEFMU0EgQ29udHJvbCAobWl4
ZXIpIFVzZXJzcGFjZSBFbGVtZW50IHRlc3QKPiAgICAgICAgIOKchSBzdG9yYWdlOiBTQ1NJIFZQ
RAo+ICAgICAgICAg4pyFIHRyYWNlOiBmdHJhY2UvdHJhY2VyCj4gICAgICAgICDwn5qnIOKchSBD
SUZTIENvbm5lY3RhdGhvbgo+ICAgICAgICAg8J+apyDinIUgUE9TSVggcGpkLWZzdGVzdCBzdWl0
ZXMKPiAgICAgICAgIPCfmqcg4pyFIGp2bSAtIERhQ2FwbyBCZW5jaG1hcmsgU3VpdGUKPiAgICAg
ICAgIPCfmqcg4pyFIGp2bSAtIGpjc3RyZXNzIHRlc3RzCj4gICAgICAgICDwn5qnIOKchSBNZW1v
cnkgZnVuY3Rpb246IGthc2xyCj4gICAgICAgICDwn5qnIOKchSBMVFA6IG9wZW5wb3NpeCB0ZXN0
IHN1aXRlCj4gICAgICAgICDwn5qnIOKchSBOZXR3b3JraW5nIHZuaWM6IGlwdmxhbi9iYXNpYwo+
ICAgICAgICAg8J+apyDinYwgYXVkaXQ6IGF1ZGl0IHRlc3RzdWl0ZSB0ZXN0Cj4gICAgICAgICDw
n5qnIOKchSBpb3RvcDogc2FuaXR5Cj4gICAgICAgICDwn5qnIOKchSBVc2V4IC0gdmVyc2lvbiAx
LjktMjkKPiAgICAgICAgIPCfmqcg4pyFIHN0b3JhZ2U6IGRtL2NvbW1vbgo+IAo+ICAgIFRlc3Qg
c291cmNlczogaHR0cHM6Ly9naXRodWIuY29tL0NLSS1wcm9qZWN0L3Rlc3RzLWJlYWtlcgo+ICAg
ICAg8J+SmiBQdWxsIHJlcXVlc3RzIGFyZSB3ZWxjb21lIGZvciBuZXcgdGVzdHMgb3IgaW1wcm92
ZW1lbnRzIHRvIGV4aXN0aW5nIHRlc3RzIQo+IAo+IEFib3J0ZWQgdGVzdHMKPiAtLS0tLS0tLS0t
LS0tCj4gVGVzdHMgdGhhdCBkaWRuJ3QgY29tcGxldGUgcnVubmluZyBzdWNjZXNzZnVsbHkgYXJl
IG1hcmtlZCB3aXRoIOKaoeKaoeKaoS4KPiBJZiB0aGlzIHdhcyBjYXVzZWQgYnkgYW4gaW5mcmFz
dHJ1Y3R1cmUgaXNzdWUsIHdlIHRyeSB0byBtYXJrIHRoYXQKPiBleHBsaWNpdGx5IGluIHRoZSBy
ZXBvcnQuCj4gCj4gV2FpdmVkIHRlc3RzCj4gLS0tLS0tLS0tLS0tCj4gSWYgdGhlIHRlc3QgcnVu
IGluY2x1ZGVkIHdhaXZlZCB0ZXN0cywgdGhleSBhcmUgbWFya2VkIHdpdGgg8J+apy4gU3VjaCB0
ZXN0cyBhcmUKPiBleGVjdXRlZCBidXQgdGhlaXIgcmVzdWx0cyBhcmUgbm90IHRha2VuIGludG8g
YWNjb3VudC4gVGVzdHMgYXJlIHdhaXZlZCB3aGVuCj4gdGhlaXIgcmVzdWx0cyBhcmUgbm90IHJl
bGlhYmxlIGVub3VnaCwgZS5nLiB3aGVuIHRoZXkncmUganVzdCBpbnRyb2R1Y2VkIG9yIGFyZQo+
IGJlaW5nIGZpeGVkLgo+IAo+IFRlc3RpbmcgdGltZW91dAo+IC0tLS0tLS0tLS0tLS0tLQo+IFdl
IGFpbSB0byBwcm92aWRlIGEgcmVwb3J0IHdpdGhpbiByZWFzb25hYmxlIHRpbWVmcmFtZS4gVGVz
dHMgdGhhdCBoYXZlbid0Cj4gZmluaXNoZWQgcnVubmluZyB5ZXQgYXJlIG1hcmtlZCB3aXRoIOKP
sS4KPiAKPiAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQv
bGlzdGluZm8vbHRwCg==
