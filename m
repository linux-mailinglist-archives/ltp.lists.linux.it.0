Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C603A3C7F77
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 09:40:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4101B3C8719
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 09:40:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EBB713C60E0
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 09:40:06 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EB105140110F
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 09:40:05 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.68.141])
 by mail.jv-coder.de (Postfix) with ESMTPSA id DB8509FB63;
 Wed, 14 Jul 2021 07:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1626248404; bh=C9Thoj5KtMicvuV2enRYEqI6M9Jm0ZZ5VbX0XyiRQ6A=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=T6h3qTL4bzlv6d+1djbzDLCMCDe8++4RfcXVprKS3uCd/SaJVh8u8GU651XbJ9epp
 9tfpbZcndcLE8GV0r6AbtpZAgPM2U5wyfFe9JLDwWCd8I6myIwJZt0wcDmkLIlSb7/
 6Rc63ad0UzGSXBYNw6akQHffKiqrFTQ4Z0TSpwDw=
To: rpalethorpe@suse.de
References: <20210714055253.1668374-1-lkml@jv-coder.de>
 <871r81pes4.fsf@suse.de>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <dc6520e5-5bc3-b277-c33a-a553632e27a5@jv-coder.de>
Date: Wed, 14 Jul 2021 09:40:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <871r81pes4.fsf@suse.de>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] squashfs: Add regression test for sanity check
 bug
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
Cc: ltp@lists.linux.it, Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUmljaGFyZCwKCk9uIDcvMTQvMjAyMSA4OjUzIEFNLCBSaWNoYXJkIFBhbGV0aG9ycGUgd3Jv
dGU6Cj4gSGVsbG8gSm9lcmcsCj4KPiBKb2VyZyBWZWhsb3cgPGxrbWxAanYtY29kZXIuZGU+IHdy
aXRlczoKPgo+PiArICovCj4+ICsKPj4gKy8qXAo+PiArICogW0RFU0NSSVBUSU9OXQo+IEkgdGhp
bmsgaXQgaXMgW0Rlc2NyaXB0aW9uXSBub3cuCkJvdGggc2VlbSB0byB3b3JrIGFuZCB0aGVyZSBp
cyBubyBkb2N1bWVudGF0aW9uIGZvciB0aGlzLgpCdXQgbG9va3MgdGhlIGxvd2VyIGNhc2UgdmFy
aWFudCBpcyB1c2VkIG1vcmUgb2Z0ZW4uIFdpbGwgdXBkYXRlIHRoaXMgCmZvciB2My4KPgo+PiAr
ICoKPj4gKwo+PiArCS8qIENyZWF0ZSBzcXVhc2hmcyB3aXRob3V0IGFueSBjb21wb3Jlc3Npb24u
Cj4+ICsJICogVGhpcyBhbGxvd3MgcmVhc29uaW5nIGFib3V0IGJsb2NrIHNpemVzCj4+ICsJICov
Cj4+ICsJVFNUX0VYUF9QQVNTKHRzdF9zeXN0ZW0oCj4+ICsJCSJta3NxdWFzaGZzIGRhdGEgaW1h
Z2UucmF3IC1ub0kgLW5vRCAtbm9YIC1ub0YgPi9kZXYvbnVsbCAyPiYxIgo+IEkgZ3Vlc3MgdGhl
IGV4aXN0aW5nIEFQSSBmdW5jdGlvbnMgdG8gY3JlYXRlIGFuIGltYWdlIHdpbGwgbm90IHdvcmsg
d2l0aAo+IHNxdWFzaGZzPwpIb25lc3RseSBJIGRvbid0IGtub3cgd2hhdCB0aGV5IGFyZS4uLiBJ
ZiBpdCBpcyAuZm9ybWF0X2RldmljZSBzdHVmZiwgCnRoZW4gbm8sIHRoaXMgY2Fubm90IGJlIHVz
ZWQKZm9yIHNxdWFzaGZzLCBiZWNhdXNlIHRoZSBkYXRhIGhhcyB0byBiZSBwcmVwYXJlZCwgYmVm
b3JlIHRoZSBmaWxlc3lzdGVtIApjYW4gYmUgY3JlYXRlZC4KPgo+IEF0IGFueSByYXRlLCBta3Nx
dWFzaGZzIHNob3VsZCBiZSBhZGRlZCB0byAubmVlZHNfY21kcy4KUmlnaHQsIGZvcmdvdCBhYm91
dCB0aGF0IHdoZW4gY29udmVydGluZyBmcm9tIHNoZWxsCj4KPj4gKwkpLCAiQ3JlYXRlIHNxdWFz
aGZzIik7Cj4+ICsKPj4gKwlTQUZFX01LRElSKCJtbnQiLCAwNzc3KTsKPj4gKwlUU1RfRVhQX1BB
U1ModHN0X3N5c3RlbSgibW91bnQgLXRzcXVhc2hmcyAtb2xvb3AgaW1hZ2UucmF3Cj4+IG1udCIp
KTsKPiBBbHNvIHdoeSBub3QgdXNlIHNhZmVfbW91bnQ/IEkgdGhpbmsgd2UgaGF2ZSBzb21lIGlu
ZnJhIHRvIGZpbmQgYSBzcGFyZQo+IGxvb3AgZGV2aWNlICgubmVlZHNfZGV2aWNlKS4Kc2FmZV9t
b3VudCB3b3VsZCByZXN1bHQgaW4gVEJST0sgaW5zdGVhZCBvZiBURkFJTC4gU2luY2UgbW91bnRp
bmcgaXMgdGhlIAphY3R1YWwgdGVzdCwKYSBmYWlsZWQgbW91bnQgbXVzdCBiZSBURkFJTC4KQnV0
IFRTVF9FWFBfUEFTUyBpcyBhbHNvIG5vdCBpZGVhbCwgYmVjYXVzZSBpdCBzaG91bGQgdXNlIHRz
dF9icmsgYW5kIApub3QgdHN0X3Jlcy4KT3RoZXJ3aXNlIFNBRkVfVU1PVU5UIGZhaWxzIHdpdGgg
VEJST0suLgpJcyB0aGVyZSBzb21lIG90aGVyIGFwaSBmdW5jdGlvbiBvciBkbyBJIGhhdmUgdG8g
aW1wbGVtZW50IHRoZSByZXR1cm4gCnZhbHVlIGNoZWNrIG15c2VsZj8KCkhlcmUgaXMgdGhlIGRp
ZmYgZm9yIHVzaW5nIG5lZWRzX2RldmljZToKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwv
ZnMvc3F1YXNoZnMvc3F1YXNoZnNfcmVncmVzc2lvbi5jIApiL3Rlc3RjYXNlcy9rZXJuZWwvZnMv
c3F1YXNoZnMvc3F1YXNoZnNfcmVncmVzc2lvbi5jCmluZGV4IDIzZjY4MTM2Ny4uYWZmYmE4MDY5
IDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL2ZzL3NxdWFzaGZzL3NxdWFzaGZzX3JlZ3Jl
c3Npb24uYworKysgYi90ZXN0Y2FzZXMva2VybmVsL2ZzL3NxdWFzaGZzL3NxdWFzaGZzX3JlZ3Jl
c3Npb24uYwpAQCAtNDQsNiArNDQsNyBAQCBzdGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQpCiDCoHN0
YXRpYyB2b2lkIHJ1bih2b2lkKQogwqB7CiDCoMKgwqDCoCBpbnQgaTsKK8KgwqDCoCBjaGFyIGNt
ZFsxMDI0XTsKCiDCoMKgwqDCoCB0c3RfcmVzKFRJTkZPLCAiVGVzdCBzcXVhc2hmcyBzYW5pdHkg
Y2hlY2sgcmVncmVzc2lvbnMiKTsKCkBAIC02NiwxNSArNjcsMTcgQEAgc3RhdGljIHZvaWQgcnVu
KHZvaWQpCiDCoMKgwqDCoCDCoMKgwqAgY2xvc2UoZmQpOwogwqDCoMKgwqAgfQoKLcKgwqDCoCAv
KiBDcmVhdGUgc3F1YXNoZnMgd2l0aG91dCBhbnkgY29tcG9yZXNzaW9uLgotwqDCoMKgIMKgKiBU
aGlzIGFsbG93cyByZWFzb25pbmcgYWJvdXQgYmxvY2sgc2l6ZXMKK8KgwqDCoCAvKiBDcmVhdGUg
c3F1YXNoZnMgd2l0aG91dCBhbnkgY29tcHJlc3Npb24uCivCoMKgwqAgwqAqIFRoaXMgYWxsb3dz
IHJlYXNvbmluZyBhYm91dCBibG9jayBzaXplcy4KK8KgwqDCoCDCoCogUmVkaXJlY3Qgc3Rkb3V0
LCB0byBnZXQgcmlkIG9mIHVuZGVmaW5lZCB1aWQgbWVzc2FnZXMKIMKgwqDCoMKgIMKgKi8KLcKg
wqDCoCBUU1RfRVhQX1BBU1ModHN0X3N5c3RlbSgKLcKgwqDCoCDCoMKgwqAgIm1rc3F1YXNoZnMg
ZGF0YSBpbWFnZS5yYXcgLW5vSSAtbm9EIC1ub1ggLW5vRiA+L2Rldi9udWxsIDI+JjEiCi3CoMKg
wqAgKSwgIkNyZWF0ZSBzcXVhc2hmcyIpOworwqDCoMKgIHNwcmludGYoY21kLAorwqDCoMKgIMKg
wqDCoMKgwqDCoMKgICJta3NxdWFzaGZzIGRhdGEgJXMgLW5vSSAtbm9EIC1ub1ggLW5vRiAtbm9h
cHBlbmQgPi9kZXYvbnVsbCIsCivCoMKgwqAgwqDCoMKgIMKgwqDCoCB0c3RfZGV2aWNlLT5kZXYp
OworwqDCoMKgIFRTVF9FWFBfUEFTUyh0c3Rfc3lzdGVtKGNtZCksICJDcmVhdGUgc3F1YXNoZnMi
KTsKCiDCoMKgwqDCoCBTQUZFX01LRElSKCJtbnQiLCAwNzc3KTsKLcKgwqDCoCBUU1RfRVhQX1BB
U1ModHN0X3N5c3RlbSgibW91bnQgLXRzcXVhc2hmcyAtb2xvb3AgaW1hZ2UucmF3IG1udCIpKTsK
K8KgwqDCoCBUU1RfRVhQX1BBU1MobW91bnQodHN0X2RldmljZS0+ZGV2LCAibW50IiwgInNxdWFz
aGZzIiwgMCwgTlVMTCkpOwoKIMKgwqDCoMKgIFNBRkVfVU1PVU5UKCJtbnQiKTsKCkBAIC04NSw5
ICs4OCwxNCBAQCBzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7CiDCoMKgwqDCoCAudGVz
dF9hbGwgPSBydW4sCiDCoMKgwqDCoCAuY2xlYW51cCA9IGNsZWFudXAsCiDCoMKgwqDCoCAubmVl
ZHNfcm9vdCA9IDEsCivCoMKgwqAgLm5lZWRzX2RldmljZSA9IDEsCivCoMKgwqAgLmRldl9taW5f
c2l6ZSA9IDEsCivCoMKgwqAgLm5lZWRzX2NtZHMgPSAoY29uc3QgY2hhciAqY29uc3QgW10pIHsK
K8KgwqDCoCDCoMKgwqAgIm1rc3F1YXNoZnMiLAorwqDCoMKgIMKgwqDCoCBOVUxMCivCoMKgwqAg
fSwKIMKgwqDCoMKgIC5uZWVkc19kcml2ZXJzID0gKGNvbnN0IGNoYXIgKmNvbnN0IFtdKSB7CiDC
oMKgwqDCoCDCoMKgwqAgInNxdWFzaGZzIiwKLcKgwqDCoCDCoMKgwqAgImxvb3AiLAogwqDCoMKg
wqAgwqDCoMKgIE5VTEwKIMKgwqDCoMKgIH0sCiDCoMKgwqDCoCAudGFncyA9IChjb25zdCBzdHJ1
Y3QgdHN0X3RhZ1tdKSB7CgoKSm9lcmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
