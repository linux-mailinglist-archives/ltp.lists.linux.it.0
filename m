Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 965942C7FDA
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 09:30:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5E7003C2C7C
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 09:30:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2DF813C2555
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 09:30:51 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BE9741400BD4
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 09:30:50 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id B07CAA07F1;
 Mon, 30 Nov 2020 08:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1606725048; bh=k9LaPOmgvbBOHsxlC+3e58E0pr0Pc25p9DF/FNJmDRs=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=VDL0aXD1RLo1hizBBGBBccANG00a56H3yhgcbGTg5HE2BO+8dRSXLqc1DSF95zzHF
 y72dtX29+l5t6/64Nan0fOMrprNBwb2NRm9qElks6HYON8yF273PjjUdntX9Sihp+g
 7OZeopDHVzjjencGNQ+ZVUTPLCI1mgrNae2klNbE=
To: rpalethorpe@suse.de
References: <20201127071419.20370-1-lkml@jv-coder.de> <87360rnuio.fsf@suse.de>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <01818271-8dba-96a3-76f3-575243c93243@jv-coder.de>
Date: Mon, 30 Nov 2020 09:30:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <87360rnuio.fsf@suse.de>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3] overcommit_memory: Fix unstable subtest
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCj4+ICtzdGF0aWMgbG9uZyBnZXRfdG90YWxfYmF0Y2hfc2l6ZV9ieXRlcyh2b2lkKQo+PiAr
ewo+PiArCXN0cnVjdCBzeXNpbmZvIGluZm87Cj4+ICsJbG9uZyBuY3B1cyA9IHRzdF9uY3B1c19j
b25mKCk7Cj4gSSdtIG5vdCBjb21wbGV0ZWx5IHN1cmUgaWYgdGhpcyBpcyB0aGUgc2FtZSB2YWx1
ZSBhcyBudW1fY3B1c19wcmVzZW50KCkKPiBpbiB0aGUga2VybmVsPyBJJ20ganVzdCB3b25kZXJp
bmcgaWYgQ1BVIGhvdHBsdWdnaW5nIGNvdWxkIHJlc3VsdCBpbiB0aGUKPiB3cm9uZyB2YWx1ZSBi
ZWluZyBjYWxjdWxhdGVkIChvdGhlciB0aGFuIGlmIGl0IGlzIGhvdHBsdWdnZWQgd2hpbGUgdGhl
IHRlc3QKPiBpcyBydW5uaW5nKS4KCkkgd2FzIHRoaW5raW5nIGFib3V0IHRoaXMgYXMgd2VsbCB3
aGVuIEkgaW1wbGVtZW50ZWQgdGhpcy4gSGVyZSBpcyBteSAKcmVhc29uaW5nOgoKSWYgaG90cGx1
ZyBpcyBkaXNhYmxlZCBwb3NzaWJsZT1wcmVzZW50IGFuZCBwb3NzaWJsZT1uciBjcHVzIGF0IGJv
b3QuIApPdGhlcndpc2UgcHJlc2VudCBpcyB0aGUgcmVhbCBudW1iZXIgb2YgZXhpc3RpbmcgKG5v
dCBuZWNlc3NhcmlseSAKZW5hYmxlZCBjcHVzKSwgYW5kIHBvc3NpYmxlPU5SX0NQVQpJbiBib3Ro
IGNhc2VzIGl0IGlzIHRoZSBudW1iZXIgb2YgY3B1cyBpbnN0YWxsZWQgaW4gdGhlIHN5c3RlbSwg
ZW5hYmxlZCAKb3Igbm90LgoKdHN0X25jcHVzX2NvbmYgaXMgX1NDX05QUk9DRVNTT1JTX0NPTkYs
IHdoaWNoIGlzIGRvY3VtZW50ZWQgYXMgInJldHVybnMgCnRoZSBudW1iZXIgb2YgcHJvY2Vzc29y
cyB0aGUgb3BlcmF0aW5nIHN5c3RlbSBjb25maWd1cmVkLiBCdXQgaXQgbWlnaHQgCmJlIHBvc3Np
YmxlIGZvciB0aGUgb3BlcmF0aW5nIHN5c3RlbSB0byBkaXNhYmxlIGluZGl2aWR1YWwgcHJvY2Vz
c29ycyAKYW5kIHNvIHRoZSBjYWxsIiwgaW4gY29udHJhc3QgdG8gX1NDX05QUk9DRVNTT1JTX09O
TE4gInJldHVybnMgdGhlIApudW1iZXIgb2YgcHJvY2Vzc29ycyB3aGljaCBhcmUgY3VycmVudGx5
IG9ubGluZSAoaS5lLiwgYXZhaWxhYmxlKS4iLgoKSSB3b3VsZCBpbnRlcnByZXQgX1NDX05QUk9D
RVNTT1JTX0NPTkYgYXMgZXF1YWwgdG8gcHJlc2VudCBhbmQgCl9TQ19OUFJPQ0VTU09SU19PTkxO
IGFzIGVxdWFsIHRvIG9ubGluZS4KCkFueXRoaW5nIGZsYXcgaW4gbXkgbG9naWM/CgpKw7ZyZwoK
LS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo=
