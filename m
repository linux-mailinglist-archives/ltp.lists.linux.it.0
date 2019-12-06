Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B491154B6
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Dec 2019 16:59:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 419943C2405
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Dec 2019 16:59:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D3E2C3C0738
 for <ltp@lists.linux.it>; Fri,  6 Dec 2019 16:50:51 +0100 (CET)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 473D86017FA
 for <ltp@lists.linux.it>; Fri,  6 Dec 2019 16:50:49 +0100 (CET)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB6FoWDu130516;
 Fri, 6 Dec 2019 09:50:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1575647432;
 bh=z1ddrnBoswoODisAIcZF+CmtQE/vK0JijAZ3Pcui0/8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ck/TEkSd1WRGxGle/weXm1bH3Vb6ntIT4d+cMTnFZagvX7NwZwBcK8qfvu9hHCWx8
 eYmbMzvX/KLRdBAYx77pZdyRPPoXGjxP1sHXwE3cy9v0/tafllj/9gf1MdNMVzmet9
 Z+IU+BRN9B95zO2YKkoljgSYfU0D6WYzpkBJfPIU=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB6FoVHd101978
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 6 Dec 2019 09:50:32 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 6 Dec
 2019 09:50:31 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 6 Dec 2019 09:50:31 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB6FoTwG128051;
 Fri, 6 Dec 2019 09:50:30 -0600
To: Joerg Vehlow <lkml@jv-coder.de>, Petr Vorel <pvorel@suse.cz>,
 <linux-rt-users@vger.kernel.org>, <rt@linutronix.de>
References: <20191205135020.GA7951@dell5510>
 <6a7fbfdf-4fda-70bb-01d8-19fb6218170d@jv-coder.de>
Message-ID: <bc04bede-48fb-68e4-2ade-6125268008a4@ti.com>
Date: Fri, 6 Dec 2019 17:50:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6a7fbfdf-4fda-70bb-01d8-19fb6218170d@jv-coder.de>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 06 Dec 2019 16:59:05 +0100
Subject: Re: [LTP] LTP realtime tests
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
From: Grygorii Strashko via ltp <ltp@lists.linux.it>
Reply-To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Carlos Hernandez <ceh@ti.com>, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Q0M6CgpPbiAwNi8xMi8yMDE5IDA4OjEzLCBKb2VyZyBWZWhsb3cgd3JvdGU6Cj4gSGkgUGV0ciwK
PiAKPiB3ZSBhcmUgcnVubmluZyB0aGVzZSB0ZXN0cyBhbmQgZnJvbSB3aGF0IEkndmUgc2VlbiB0
aGUgcXVhbGl0eSBpcyB2ZXJ5IHBvb3IuCj4gV2UgaGFkIHRvIG1ha2UgY2hhbmdlcyB0byBhIGxv
dCBvZiB0aGVtIHRvIG1ha2UgdGhlbSBwYXNzIHJlbGlhYmx5Ogo+IG1vc3Qgb2YgdGhlIHRlc3Rz
OiBNaXNzaW5nIGNoZWNrcyBvZiByZXR1cm4gdmFsdWUgZm9yIHB0aHJlYWQgZnVuY3Rpb24gYW5k
IHJlc3VsdGluZyBkZWFkbG9jawo+IHByaW8td2FrZSBhbmQgcHJpby1wcmVlbXB0OiBCb3VuZCB0
byBhIHNpbmdsZSBjcHUgY29yZQo+IHNjaGVkX2Zvb3RiYWxsOiBOZWVkcyBhIHNsZWVwIHRvIHJ1
biByZWxpYWJsZSAoSSBzZW5kIGEgbWFpbCBzb21lIHRpbWUgYWdvIHRvIHRoaXMgbWFpbGluZyBs
aXN0Cj4gcmVnYXJkaW5nIHRoZSB2YWxpZGl0eSBvZiB0aGUgdGVzdCwgd2hpY2ggZ290IGZvcndh
cmRlZCB0byBsa21sIGJ5IGN5cmlsLCBidXQgbm8gcmVwbHkpCj4gCj4gU29tZSB0ZXN0cyBkbyBu
b3QgcmV0dXJuIHRoZSBjb3JyZWN0IHJlc3VsdCBlLmcuOgo+IHRlc3RwaS01LCB0ZXN0cGktNiwg
c2NoZWRfaml0dGVyLCBndG9kX2xhdGVuY3kKPiAKPiBJIGhhdmVuJ3QgcmVhbGx5IGxvb2tlZCBp
bnRvIG1vc3Qgb2YgdGhlc2UgdGVzdHMuCj4gCj4gSsO2cmcKPiAKPiBBbSAwNS4xMi4yMDE5IHVt
IDE0OjUwIHNjaHJpZWIgUGV0ciBWb3JlbDoKPj4gSGkgUlQgZm9sa3MsCj4+Cj4+IGxvb2tpbmcg
aW50byBMVFAgcmVhbHRpbWUgdGVzdHMgKHRlc3RjYXNlcy9yZWFsdGltZS8gWzFdKSwKPj4gdGhl
IGNvZGUgY2VydGFpbmx5IGRlc2VydmVzIGNsZWFudXAuCj4+Cj4+IExvb2tpbmcgYXQgWzJdLCBp
dCBkb2VzIG5vdCBtZW50aW9uIHRoZXNlIHRlc3RzIGF0IGFsbC4KPj4gQ2FuIGFueW9uZSBjb21t
ZW50IG9uIHJlbGV2YW5jZSBvZiB0aGVzZSB0ZXN0cyB0byBjdXJyZW50IFJUPwo+PiBEb2VzIGFu
eW9uZSB1c2UgdGhlc2UgdGVzdHM/Cj4+Cj4+IFRoYW5rcyBmb3IgZmVlZGJhY2suCj4+Cj4+IEtp
bmQgcmVnYXJkcywKPj4gUGV0cgo+Pgo+PiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRl
c3QtcHJvamVjdC9sdHAvdHJlZS9tYXN0ZXIvdGVzdGNhc2VzL3JlYWx0aW1lCj4+IFsyXSBodHRw
czovL2VsaW51eC5vcmcvUmVhbHRpbWVfVGVzdGluZ19CZXN0X1ByYWN0aWNlcyNUZXN0X3Byb2dy
YW1zCj4+Cj4gCgotLSAKQmVzdCByZWdhcmRzLApncnlnb3JpaQoKLS0gCk1haWxpbmcgbGlzdCBp
bmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
