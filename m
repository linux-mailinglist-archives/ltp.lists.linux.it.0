Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A6BA748CB
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Mar 2025 11:58:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1743159492; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=3HYzLe7Af0HryyorcH51ltnpuI1R4+WxgttRWgGBTxI=;
 b=PKdCPX9kYmGPyM8eVNrRIbH3/MNn2GfIh1dSpMrri+yEL046MdV903RUEpORzMPxCzKEk
 NBhX2X6zNbiezCBv2oVvdxibkMwX3Z4XfmlBAh5HI6fwg9VONB6/K/alNLZZ5tIXO3nzOnB
 Hzq1V//DxI0SQy3XWoCTSVGsKlfxEyY=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8923B3CA27C
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Mar 2025 11:58:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D6A2B3C9B47
 for <ltp@lists.linux.it>; Fri, 28 Mar 2025 11:58:00 +0100 (CET)
Authentication-Results: in-5.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwan@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1CE48600C2A
 for <ltp@lists.linux.it>; Fri, 28 Mar 2025 11:57:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743159475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s0Oy9FVjRq/xzxRLOt9S0TaI8kvyT4o2obbICHR980Y=;
 b=aah94pqnkIN8Sr9GIpjw7MZz53bMvSEQuG8Os/tfk3gKbcZ7Ke6P0YBbUb1Y4sz6t5SNu1
 J3wHlUu1y1wfBYrMF0WU91OWTTTQqRlp+RYtXQ0c4CTWt28zvxL6UXAkc1UIeK5n/x1LKd
 aE7oFDnuVt9X1rDrg2QRlKKPIv1761E=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-CGtwrHpYNiq6QvJKYe1uSA-1; Fri, 28 Mar 2025 06:57:52 -0400
X-MC-Unique: CGtwrHpYNiq6QvJKYe1uSA-1
X-Mimecast-MFC-AGG-ID: CGtwrHpYNiq6QvJKYe1uSA_1743159472
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2ff854a2541so3265408a91.0
 for <ltp@lists.linux.it>; Fri, 28 Mar 2025 03:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743159472; x=1743764272;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s0Oy9FVjRq/xzxRLOt9S0TaI8kvyT4o2obbICHR980Y=;
 b=VRFlObr+rF531HAtLe3UJ8T5NFKghkQG+RvTTDylLZ0HGMS3tZsdrkepYS8+Z/lb9/
 YiWk3CfFwBl8sIZpIORbeHZEDK1oGiZWMiV9R3Al3Ehtzc219L0qNpdGn1jOEQ3FD8WT
 019GcTWIzybQTSgjRCjovfVVHpl70Ya1BUaBqxv+ubo3v1SiziNXIQ7vyWiTT/KAlrQ1
 Nn1LbwduSFQusxI69zgx3zetX4B2CoEO4hBzGkUqrpIPBrGDcRF2fHfYc1HgNWm/tTwI
 fRWpXbSvfFs+BMdvvlFCLDNCAYnBMokvL4ZJbLW5UB8WwwT9fNJNRMO1M4Z2+A43MdP1
 TETg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV954L/IQqVv0S9lWXmzjrCfOex5CLqlWg9CeR9WC2gOB/Od6TAr+GCTlwtMJD4i36KV+I=@lists.linux.it
X-Gm-Message-State: AOJu0Yz2xFnWCcc/JO3rLJCPSg5ww+lY7de2Ue3XjwcHhWEzz8bPIMa/
 /wIvUmyeJIBNyE41LYVmTJ2dUgMxwFi6fFY9yJD7ypnePCKLWxCchhQW8Y/jAkAr0pwZGgyvHXU
 crPQpzOcBusbVHoczTY0ii0VdyTBEexaMDFPQqDBIwX2iqkHL8nVEZ7o9E8yfsTTQuc7Ab2l0ck
 T6TW4aoSrEgUD4N6am50m76mg=
X-Gm-Gg: ASbGncv1vGrUSw6Z6SLPgnPUrsurJHElCUsZts6zyaX5o9sIhamqNUJFSd23S7copBu
 pBNmXI6bxtqxMhcLaSeM5wEMYu2vvNIwsh9EBcprd67XFGVZqW1NOUwXG05HiUFAVez4ikvCB6Q
 ==
X-Received: by 2002:a17:90b:1f92:b0:2f1:3355:4a8f with SMTP id
 98e67ed59e1d1-303a7d5b66dmr10880490a91.4.1743159471326; 
 Fri, 28 Mar 2025 03:57:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFRmHMm8LHcF5nsRxgwC+8ck6o7zkn8kDntoqzMaZRK8V+qCP4AHTfA694RbfKR7iRXb/UUdAPV6HYE1O3W5A=
X-Received: by 2002:a17:90b:1f92:b0:2f1:3355:4a8f with SMTP id
 98e67ed59e1d1-303a7d5b66dmr10880427a91.4.1743159470482; Fri, 28 Mar 2025
 03:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250324120049.29270-1-wegao@suse.com>
 <20250328075958.7616-1-wegao@suse.com>
 <20250328075958.7616-2-wegao@suse.com>
 <CAEemH2fYLZ9=jS190QXiYOza=1=hvVvpHu-8mWOYG7QKEcqgcA@mail.gmail.com>
 <20250328102008.GA170353@pevik>
In-Reply-To: <20250328102008.GA170353@pevik>
Date: Fri, 28 Mar 2025 18:57:38 +0800
X-Gm-Features: AQ5f1JrZvab_olhu4oCBKaf6Ob4IPzyBO_JfyrdlrTBo-bu6Sg4TErfbIJTHyEo
Message-ID: <CAEemH2f9==38Dq=6QBuYwsuw3yF=hogWksE5qX1bPUb4ysfOUg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 84OFUMwb036rQXwZzEAQ5AyDky7zK9L7H3XHZLGRdIs_1743159472
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH v8 1/2] cpuset02: Convert the test6 from
 cpuset_memory_testset.sh to C code
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gRnJpLCBNYXIgMjgsIDIwMjUgYXQgNjoyMOKAr1BNIFBldHIgVm9yZWwgPHB2b3JlbEBzdXNl
LmN6PiB3cm90ZToKCj4gSGkgTGkKPgo+ID4gSGkgV2VpLAo+Cj4gPiBHZW5lYWxseSBsb29rcyBn
b29kLCBidXQgc29tZSB0aW55IHBsYWNlcyBuZWVkIGltcHJvdmVtZW50Lgo+ID4gU2VlIGNvbW1l
bnRzIGlubGluZS4KPgo+IFRoYW5rcyBmb3IgdGhlIHJldmlldyEKPgo+ID4gT24gRnJpLCBNYXIg
MjgsIDIwMjUgYXQgNDowMOKAr1BNIFdlaSBHYW8gPHdlZ2FvQHN1c2UuY29tPiB3cm90ZToKPgo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgR2FvIDx3ZWdhb0BzdXNlLmNvbT4KPiA+ID4gUmV2aWV3
ZWQtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgo+ID4gPiBTdWdnZXN0ZWQtYnk6IExp
IFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGxpYi90c3RfY2dyb3Vw
LmMgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiA+ID4gIHJ1bnRlc3QvbW0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiA+ID4gIHRlc3RjYXNlcy9rZXJuZWwvbWVt
Ly5naXRpZ25vcmUgICAgICAgIHwgICAxICsKPiA+ID4gIHRlc3RjYXNlcy9rZXJuZWwvbWVtL2Nw
dXNldC9NYWtlZmlsZSAgIHwgICA1ICsKPiA+ID4gIHRlc3RjYXNlcy9rZXJuZWwvbWVtL2NwdXNl
dC9jcHVzZXQwMi5jIHwgMTM4ICsrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIDUgZmls
ZXMgY2hhbmdlZCwgMTQ2IGluc2VydGlvbnMoKykKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0
ZXN0Y2FzZXMva2VybmVsL21lbS9jcHVzZXQvY3B1c2V0MDIuYwo+Cj4gPiA+IGRpZmYgLS1naXQg
YS9saWIvdHN0X2Nncm91cC5jIGIvbGliL3RzdF9jZ3JvdXAuYwo+ID4gPiBpbmRleCA3M2I2OTZj
NTguLjU0NWM3NzllNyAxMDA2NDQKPiA+ID4gLS0tIGEvbGliL3RzdF9jZ3JvdXAuYwo+ID4gPiAr
KysgYi9saWIvdHN0X2Nncm91cC5jCj4gPiA+IEBAIC0yMDQsNiArMjA0LDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBjZ3JvdXBfZmlsZQo+IGNwdXNldF9jdHJsX2ZpbGVzW10gPSB7Cj4gPiA+ICAg
ICAgICAgeyAiY3B1c2V0LmNwdXMiLCAiY3B1c2V0LmNwdXMiLCBDVFJMX0NQVVNFVCB9LAo+ID4g
PiAgICAgICAgIHsgImNwdXNldC5tZW1zIiwgImNwdXNldC5tZW1zIiwgQ1RSTF9DUFVTRVQgfSwK
PiA+ID4gICAgICAgICB7ICJjcHVzZXQubWVtb3J5X21pZ3JhdGUiLCAiY3B1c2V0Lm1lbW9yeV9t
aWdyYXRlIiwKPiBDVFJMX0NQVVNFVCB9LAo+ID4gPiArICAgICAgIHsgImNwdXNldC5zY2hlZF9s
b2FkX2JhbGFuY2UiLCAiY3B1c2V0LnNjaGVkX2xvYWRfYmFsYW5jZSIsCj4gPiA+IENUUkxfQ1BV
U0VUIH0sCj4KPgo+ID4gY3B1c2V0LnNjaGVkX2xvYWRfYmFsYW5jZSBpcyB1c2VmdWwgdG8gZW5h
YmxlL2Rpc2FibGUgdGhlIHNjaGVkdWxlciBjYW4KPiBtb3ZlCj4gPiB0YXNrcyBiZXR3ZWVuIENQ
VXMgaW4gdGhlIGNwdXNldC4KPgo+ID4gSXMgdGhlcmUgYW55IHB1cnBvc2UgdG8gYWRkIHRoaXMg
a25vYiBpbiBjcHVzZXQwMiBwYXRjaD8gSSBkaWRuJ3Qgc2VlIHlvdQo+ID4gdG91Y2ggaXQgaW4g
dGhlIHRlc3QuCj4KPiBXZWkgbWlnaHQgaGFkIGEgZGlmZmVyZW50IHJlYXNvbiwgYnV0IEkgc2Vl
IGFsbCBmdW5jdGlvbnMgaW4KPiBjcHVzZXRfbWVtb3J5X3Rlc3RzZXQuc2ggKGluY2x1ZGluZyB0
ZXN0NiBiZWluZyByZXdyaXR0ZW4gdG8gdGhpcyB0ZXN0KQo+IGNhbGwKPiBjcHVzZXRfZnVuY3Mu
c2ggd2hpY2ggZG9lcyAnZWNobyAwID4gLi4uL2NwdXNldC5zY2hlZF9sb2FkX2JhbGFuY2UnLCBz
ZWU6Cj4KPiB0ZXN0NigpCj4gewo+ICAgICAgICAgLi4uCj4gICAgICAgICBjcHVzZXRfc2V0ICIk
Q1BVU0VULzAiICIkY3B1X29mX25vZGUwIiAiMCIgIjAiIDI+Cj4gJENQVVNFVF9UTVAvc3RkZXJy
Cj4KPiBjcHVzZXRfc2V0KCkKPiB7Cj4gICAgICAgICAuLi4KPiAgICAgICAgIGxvY2FsIGxvYWRf
YmFsYW5jZT0iJDQiCj4gICAgICAgICAuLi4KPiAgICAgICAgIC9iaW4vZWNobyAkbG9hZF9iYWxh
bmNlID4gJHBhdGgvY3B1c2V0LnNjaGVkX2xvYWRfYmFsYW5jZQo+Cj4gSSB3b25kZXIgd2hldGhl
ciBpdCdzIGdvb2Qgb3Igbm90Lgo+CgpPaywgSSBzZWUsIGl0IHdhcyB1c2VkIHRvIGRpc2FibGUg
dGhlIHRhc2sgZnJvbSBtb3ZpbmcgYmV0d2VlbiBDUFVzCmluIHRoZSBjcHVzZXQuIEJ1dCB0byBi
ZSBob25lc3QsIHRoYXQncyBfbm90XyBuZWNlc3NhcnksIGJlY2F1c2Ugd2hhdGV2ZXIKdGhlIHRh
c2sgaXMgYm91bmQgdG8gd2hpY2ggQ1BVIG9mIHRoZSBjcHVzZXQsIGl0IGFsbCBiZWxvbmdzIHRv
IHRoYXQKc3BlY2lmaWVkCm5vZGUgYnkgbGltaXRlZCBDZ3JvdXAuCgpTbyBJIHdvdWxkIGRyb3Ag
dGhpcyBrbm9iIHNldHRpbmcgaW4gbmV3IEMgdGVzdC4KCgoKPgo+IEtpbmQgcmVnYXJkcywKPiBQ
ZXRyCj4KPiA+ICAgICAgICAgeyB9Cj4gPiA+ICB9Owo+Cj4gPiA+IGRpZmYgLS1naXQgYS9ydW50
ZXN0L21tIGIvcnVudGVzdC9tbQo+ID4gPiBpbmRleCBkOGU2MmFmODEuLjVhZjI5YjBlYSAxMDA2
NDQKPiA+ID4gLS0tIGEvcnVudGVzdC9tbQo+ID4gPiArKysgYi9ydW50ZXN0L21tCj4gPiA+IEBA
IC03NSw2ICs3NSw3IEBAIGtzbTA2XzIga3NtMDYgLW4gODAwMAo+ID4gPiAga3NtMDcga3NtMDcK
Pgo+ID4gPiAgY3B1c2V0MDEgY3B1c2V0MDEKPiA+ID4gK2NwdXNldDAyIGNwdXNldDAyCj4KPiA+
ID4gIG9vbTAxIG9vbTAxCj4gPiA+ICBvb20wMiBvb20wMgo+ID4gPiBkaWZmIC0tZ2l0IGEvdGVz
dGNhc2VzL2tlcm5lbC9tZW0vLmdpdGlnbm9yZQo+ID4gPiBiL3Rlc3RjYXNlcy9rZXJuZWwvbWVt
Ly5naXRpZ25vcmUKPiA+ID4gaW5kZXggNjk5ZTAyMmZiLi5lMjRlOTYwMDEgMTAwNjQ0Cj4gPiA+
IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvbWVtLy5naXRpZ25vcmUKPiA+ID4gKysrIGIvdGVzdGNh
c2VzL2tlcm5lbC9tZW0vLmdpdGlnbm9yZQo+ID4gPiBAQCAtMSw0ICsxLDUgQEAKPiA+ID4gIC9j
cHVzZXQvY3B1c2V0MDEKPiA+ID4gKy9jcHVzZXQvY3B1c2V0MDIKPiA+ID4gIC9odWdldGxiL2h1
Z2VmYWxsb2NhdGUvaHVnZWZhbGxvY2F0ZTAxCj4gPiA+ICAvaHVnZXRsYi9odWdlZmFsbG9jYXRl
L2h1Z2VmYWxsb2NhdGUwMgo+ID4gPiAgL2h1Z2V0bGIvaHVnZWZvcmsvaHVnZWZvcmswMQo+ID4g
PiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9tZW0vY3B1c2V0L01ha2VmaWxlCj4gPiA+
IGIvdGVzdGNhc2VzL2tlcm5lbC9tZW0vY3B1c2V0L01ha2VmaWxlCj4gPiA+IGluZGV4IGJhYzEz
ZTAyYi4uNzAxMGM3YmU0IDEwMDY0NAo+ID4gPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL21lbS9j
cHVzZXQvTWFrZWZpbGUKPiA+ID4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9tZW0vY3B1c2V0L01h
a2VmaWxlCj4gPiA+IEBAIC0xOSw2ICsxOSwxMSBAQAo+Cj4gPiA+ICB0b3Bfc3JjZGlyICAgICAg
ICAgICAgID89IC4uLy4uLy4uLy4uCj4KPiA+ID4gK0xUUExJQlMgPSBudW1hCj4gPiA+ICsKPiA+
ID4gIGluY2x1ZGUgJCh0b3Bfc3JjZGlyKS9pbmNsdWRlL21rL3Rlc3RjYXNlcy5tawo+ID4gPiAg
aW5jbHVkZSAkKHRvcF9zcmNkaXIpL3Rlc3RjYXNlcy9rZXJuZWwvaW5jbHVkZS9saWIubWsKPiA+
ID4gKwo+ID4gPiArY3B1c2V0MDI6IExUUExETElCUyA9IC1sbHRwbnVtYQo+ID4gPiArCj4gPiA+
ICBpbmNsdWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9tay9nZW5lcmljX2xlYWZfdGFyZ2V0Lm1r
Cj4gPiA+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL21lbS9jcHVzZXQvY3B1c2V0MDIu
Ywo+ID4gPiBiL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL2NwdXNldC9jcHVzZXQwMi5jCj4gPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+IGluZGV4IDAwMDAwMDAwMC4uMjZiNzdmOGJlCj4gPiA+
IC0tLSAvZGV2L251bGwKPiA+ID4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9tZW0vY3B1c2V0L2Nw
dXNldDAyLmMKPiA+ID4gQEAgLTAsMCArMSwxMzggQEAKPiA+ID4gKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBMR1BMLTIuMS1vci1sYXRlcgo+ID4gPiArLyoKPiA+ID4gKyAqIENvcHlyaWdo
dCAoYykgMjAyNSBTVVNFIExMQyA8d2VnYW9Ac3VzZS5jb20+Cj4gPiA+ICsgKi8KPiA+ID4gKwo+
ID4gPiArLypcCj4gPiA+ICsgKiBUZXN0IGNoZWNrcyBjcHVzZXQubWVtcyB3b3JrcyB3aXRoIGh1
Z2VwYWdlIGZpbGUuCj4gPiA+ICsgKiBCYXNlZCBvbiB0ZXN0NiBmcm9tIGNwdXNldF9tZW1vcnlf
dGVzdHNldC5zaCB3cml0dGVuIGJ5IE1pYW8gWGllLgo+ID4gPiArICovCj4gPiA+ICsKPiA+ID4g
KyNkZWZpbmUgX0dOVV9TT1VSQ0UKPiA+ID4gKyNpbmNsdWRlIDxzdGRpby5oPgo+ID4gPiArI2lu
Y2x1ZGUgPHN5cy9tb3VudC5oPgo+ID4gPiArI2luY2x1ZGUgPGxpbWl0cy5oPgo+ID4gPiArI2lu
Y2x1ZGUgPHN5cy9wYXJhbS5oPgo+ID4gPiArI2luY2x1ZGUgPHN5cy90eXBlcy5oPgo+ID4gPiAr
I2luY2x1ZGUgInRzdF90ZXN0LmgiCj4gPiA+ICsKPiA+ID4gKyNpZmRlZiBIQVZFX05VTUFfVjIK
PiA+ID4gKyNpbmNsdWRlIDxudW1haWYuaD4KPiA+ID4gKyNpbmNsdWRlICJ0c3RfbnVtYS5oIgo+
ID4gPiArCj4gPiA+ICsjZGVmaW5lIE1OVFBPSU5UICJodWdldGxiZnMvIgo+ID4gPiArI2RlZmlu
ZSBIVUdFX1BBR0VfRklMRSBNTlRQT0lOVCAiaHVnZXBhZ2VmaWxlIgo+ID4gPiArCj4gPiA+ICtz
dGF0aWMgbG9uZyBocGFnZV9zaXplOwo+ID4gPiArc3RhdGljIHN0cnVjdCB0c3Rfbm9kZW1hcCAq
bm9kZTsKPiA+ID4gK3N0YXRpYyBpbnQgY2hlY2tfbm9kZV9pZDsKPiA+ID4gK3N0YXRpYyBzdHJ1
Y3QgdHN0X2NnX2dyb3VwICpjZ19jcHVzZXRfMDsKPiA+ID4gKwo+ID4gPiArc3RhdGljIHZvaWQg
dG91Y2hfbWVtb3J5X2FuZF9jaGVja19ub2RlKGNoYXIgKnAsIGludCBzaXplKQo+ID4gPiArewo+
ID4gPiArICAgICAgIGludCBpOwo+ID4gPiArICAgICAgIGludCBub2RlID0gLTE7Cj4gPiA+ICsg
ICAgICAgbG9uZyByZXQ7Cj4gPiA+ICsgICAgICAgaW50IHBhZ2VzaXplID0gc3lzY29uZihfU0Nf
UEFHRVNJWkUpOwo+ID4gPiArCj4gPiA+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IHNpemU7IGkg
Kz0gcGFnZXNpemUpCj4gPiA+ICsgICAgICAgICAgICAgICBwW2ldID0gMHhlZjsKPiA+ID4gKwo+
ID4gPiArICAgICAgIHJldCA9IGdldF9tZW1wb2xpY3koJm5vZGUsIE5VTEwsIDAsIHAsIE1QT0xf
Rl9OT0RFIHwKPiBNUE9MX0ZfQUREUik7Cj4gPiA+ICsgICAgICAgaWYgKHJldCA8IDApCj4gPiA+
ICsgICAgICAgICAgICAgICB0c3RfYnJrKFRCUk9LIHwgVEVSUk5PLCAiZ2V0X21lbXBvbGljeSgp
IGZhaWxlZCIpOwo+ID4gPiArCj4gPiA+ICsgICAgICAgaWYgKG5vZGUgPT0gY2hlY2tfbm9kZV9p
ZCkKPiA+ID4gKyAgICAgICAgICAgICAgIHRzdF9yZXMoVFBBU1MsICJjaGVjayBub2RlIHBhc3Mi
KTsKPgo+Cj4gPiBJIHN1Z2dlc3QgcHJpbnRpbmcgdGhlIG5vZGUgZm9yIGRldGFpbGVkIGluZm8u
Cj4gPiAgICAgdHN0X3JlcyhUUEFTUywgIjEgaHVnZSBwYWdlIGFsbG9jYXRlZCBvbiBub2RlLSVk
IGFzIGV4cGVjdGVkIiwgbm9kZSk7Cj4KPgo+ID4gPiArICAgICAgIGVsc2UKPiA+ID4gKyAgICAg
ICAgICAgICAgIHRzdF9yZXMoVEZBSUwsICJjaGVjayBub2RlIGZhaWxlZCIpOwo+Cj4KPiA+ICAg
ICB0c3RfcmVzKFRGQUlMLCAiMSBodWdlIHBhZ2UgYWxsb2NhdGVkIG9uIG5vZGUtJWQgdW5leHBl
Y3RlZCIsIG5vZGUpOwo+Cj4KPgo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICtzdGF0aWMgdm9pZCBj
aGlsZCh2b2lkKQo+ID4gPiArewo+ID4gPiArICAgICAgIGNoYXIgKnA7Cj4gPiA+ICsgICAgICAg
aW50IGZkX2h1Z2VwYWdlOwo+ID4gPiArCj4gPiA+ICsgICAgICAgZmRfaHVnZXBhZ2UgPSBTQUZF
X09QRU4oSFVHRV9QQUdFX0ZJTEUsIE9fQ1JFQVQgfCBPX1JEV1IsCj4gMDc1NSk7Cj4gPiA+ICsg
ICAgICAgcCA9IFNBRkVfTU1BUChOVUxMLCBocGFnZV9zaXplLCBQUk9UX1dSSVRFIHwgUFJPVF9S
RUFELAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1BUF9TSEFSRUQsIGZk
X2h1Z2VwYWdlLCAwKTsKPiA+ID4gKwo+ID4gPiArICAgICAgIHRvdWNoX21lbW9yeV9hbmRfY2hl
Y2tfbm9kZShwLCBocGFnZV9zaXplKTsKPiA+ID4gKwo+ID4gPiArICAgICAgIFNBRkVfTVVOTUFQ
KHAsIGhwYWdlX3NpemUpOwo+ID4gPiArICAgICAgIFNBRkVfQ0xPU0UoZmRfaHVnZXBhZ2UpOwo+
ID4gPiArfQo+ID4gPiArCj4gPiA+ICtzdGF0aWMgdm9pZCBydW5fdGVzdCh2b2lkKQo+ID4gPiAr
ewo+ID4gPiArICAgICAgIGludCBwaWQ7Cj4gPiA+ICsgICAgICAgY2hhciBub2RlX2lkX3N0clsy
NTZdOwo+ID4gPiArCj4gPiA+ICsgICAgICAgY2dfY3B1c2V0XzAgPSB0c3RfY2dfZ3JvdXBfbWso
dHN0X2NnLCAiMCIpOwo+ID4gPiArCj4gPiA+ICsgICAgICAgc3ByaW50Zihub2RlX2lkX3N0ciwg
IiV1IiwgY2hlY2tfbm9kZV9pZCk7Cj4gPiA+ICsgICAgICAgU0FGRV9DR19QUklOVChjZ19jcHVz
ZXRfMCwgImNwdXNldC5tZW1zIiwgbm9kZV9pZF9zdHIpOwo+ID4gPiArCj4gPiA+ICsgICAgICAg
cGlkID0gU0FGRV9GT1JLKCk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBpZiAoIXBpZCkgewo+ID4g
PiArICAgICAgICAgICAgICAgU0FGRV9DR19QUklOVEYoY2dfY3B1c2V0XzAsICJjZ3JvdXAucHJv
Y3MiLCAiJWQiLCBwaWQpOwo+ID4gPiArICAgICAgICAgICAgICAgY2hpbGQoKTsKPiA+ID4gKyAg
ICAgICAgICAgICAgIHJldHVybjsKPiA+ID4gKyAgICAgICB9Cj4gPiA+ICsKPiA+ID4gKyAgICAg
ICBTQUZFX1dBSVRQSUQocGlkLCBOVUxMLCAwKTsKPiA+ID4gKwo+ID4gPiArICAgICAgIGNnX2Nw
dXNldF8wID0gdHN0X2NnX2dyb3VwX3JtKGNnX2NwdXNldF8wKTsKPiA+ID4gK30KPiA+ID4gKwo+
ID4gPiArc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKPiA+ID4gK3sKPiA+ID4gKyAgICAgICBub2Rl
ID0gdHN0X2dldF9ub2RlbWFwKFRTVF9OVU1BX01FTSwgZ2V0cGFnZXNpemUoKSAvIDEwMjQpOwo+
ID4gPiArICAgICAgIGlmIChub2RlLT5jbnQgPD0gMSkKPiA+ID4gKyAgICAgICAgICAgICAgIHRz
dF9icmsoVENPTkYsICJ0ZXN0IHJlcXVpcmVzIGF0IGxlYXN0IDIgTlVNQSBtZW1vcnkKPiA+ID4g
bm9kZXMiKTsKPiA+ID4gKwo+ID4gPiArICAgICAgIGNoZWNrX25vZGVfaWQgPSBub2RlLT5tYXBb
bm9kZS0+Y250IC0gMV07Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBocGFnZV9zaXplID0gU0FGRV9S
RUFEX01FTUlORk8oTUVNSU5GT19IUEFHRV9TSVpFKSoxMDI0Owo+ID4gPiArCj4gPiA+ICsgICAg
ICAgY2hhciBwYXRoWzI1Nl07Cj4gPiA+ICsgICAgICAgdW5zaWduZWQgaW50IGk7Cj4gPiA+ICsK
PiA+ID4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgbm9kZS0+Y250OyBpKyspIHsKPiA+ID4gKyAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCBjdXJyZW50X25vZGVfaWQgPSBub2RlLT5tYXBbaV07
Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAgIHNwcmludGYocGF0aCwKPiA+ID4gKwo+ID4g
Pgo+ICIvc3lzL2RldmljZXMvc3lzdGVtL25vZGUvbm9kZSVkL2h1Z2VwYWdlcy9odWdlcGFnZXMt
JWxka0IvbnJfaHVnZXBhZ2VzIiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY3VycmVu
dF9ub2RlX2lkLCBocGFnZV9zaXplIC8gMTAyNCk7Cj4gPiA+ICsgICAgICAgICAgICAgICBTQUZF
X0ZJTEVfUFJJTlRGKHBhdGgsICIlZCIsIDEpOwo+Cj4KPiA+IFNBRkVfIG1hY3JvIHdpbGwgYnJl
YWsgaWYgZmFpbHMgdG8gc2V0IHRoZSB2YWx1ZS4gSG93ZXZlciwgdGhlCj4gcmVzZXJ2YXRpb24K
PiA+IG1heSBub3QKPiA+IHN1Y2NlZWQgaGVyZSBkdWUgdG8gbWVtb3J5IGZyYWdtZW50YXRpb24u
IFNvIHdlIGNhbiBqdXN0IHVzZQo+IEZJTEVfUFJJTlRGKCkuCj4KPiA+IFRoZW4sIHdlIG5lZWQg
YW4gYWRkaXRpb25hbCBjaGVjayBmb3IgdGhlIHRhcmdldCBub2RlLCBpZiB1bmFibGUgdG8KPiA+
IHJlc2VydmUsIHRoZW4gVENPTkYgdGhlcmUuCj4KPiBJIHN1cHBvc2Ugd2UgY2Fubm90IGRvIHRo
ZSByZXNlcnZhdGlvbiB2aWEgc3RydWN0IHRzdF90ZXN0LCByaWdodD8gKHVzaW5nCj4gZS5nLiBU
U1RfU1JfU0tJUF9STyBmcm9tIGluY2x1ZGUvdHN0X3N5c19jb25mLmgpLiBUaGF0IHdvdWxkIHJl
cXVpcmUgYXQKPiBsZWFzdCB0bwo+IGFkZCB0c3RfZ2V0X25vZGVtYXAoKSB0byBzdHJ1Y3QgdHN0
X3Rlc3QsIHJpZ2h0Pwo+CgpZb3UncmUgcmlnaHQuCgpEbyB0c3RfdGVzdC5odWdlcGFnZSByZXNl
cnZhdGlvbiBpcyBub3QgcHJlY2lzZSB0byBhIHNwZWNpZmllZCBub2RlLgpXZSBoYXZlIHRvIHJl
cXVlc3QgdGhhdCB3aXRoIGRlZGljYXRlZCBjb2RlIHNvIGZhci4KCk1heWJlIHdlIGNhbiBhZGQg
c29tZXRoaW5nIHRvIHRoZSBocGFnZSByZXNlcnZhdGlvbiB0byBzdXBwb3J0IHRoYXQsCmJ1dCBJ
IGRvbid0IHNlZSB0aGF0IGZlYXR1cmUgYXMgd2lkZWx5IG5lZWRlZCBpbiBMVFAgdGVzdC4gSXQg
bWlnaHQgbm90CnZhbHVhYmxlIHRvIGJyaW5nIG1vcmUgY29tcGxleGl0eSB0byB0aGUgY29kZSBq
dXN0IGZvciB0aGlzIHJhcmVseSB1c2VkLgoKCj4gPiA+ICsgICAgICAgfQo+ID4gPiArfQo+ID4g
PiArCj4gPiA+ICtzdGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQpCj4gPiA+ICt7Cj4gPiA+ICsgICAg
ICAgaWYgKGNnX2NwdXNldF8wKQo+ID4gPiArICAgICAgICAgICAgICAgY2dfY3B1c2V0XzAgPSB0
c3RfY2dfZ3JvdXBfcm0oY2dfY3B1c2V0XzApOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICtzdGF0
aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7Cj4gPiA+ICsgICAgICAgLm5lZWRzX3Jvb3QgPSAx
LAo+Cj4KPgo+ID4gPiArICAgICAgIC5ydW5zX3NjcmlwdCA9IDEsCj4KPgo+ID4gQ2FuIHdlIHJl
bW92ZSB0aGlzIGxpbmU/Cj4KPiArMSwgZGVmaW5pdGVseSBub3QgbmVlZGVkIGhlcmUgKHdlIGRv
bid0IHVzZSBzaGVsbCBsb2FkZXIpLgo+Cj4KPiA+ID4gKyAgICAgICAubW50cG9pbnQgPSBNTlRQ
T0lOVCwKPiA+ID4gKyAgICAgICAubmVlZHNfaHVnZXRsYmZzID0gMSwKPiA+ID4gKyAgICAgICAu
c2V0dXAgPSBzZXR1cCwKPiA+ID4gKyAgICAgICAuZm9ya3NfY2hpbGQgPSAxLAo+ID4gPiArICAg
ICAgIC5jbGVhbnVwID0gY2xlYW51cCwKPiA+ID4gKyAgICAgICAudGVzdF9hbGwgPSBydW5fdGVz
dCwKPgo+Cj4KPiA+ID4gKyAgICAgICAubmVlZHNfY2hlY2twb2ludHMgPSAxLAo+Cj4KPiA+IFJl
bW92ZSB0aGlzIGxpbmU/Cj4KPiArMSwgQ3lyaWwgYXNrZWQgZm9yIHJlbW92aW5nIGNoZWNrcG9p
bnRzLCB0aGlzIGlzIGxlZnQuCj4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sdHAvWjg4WW1s
bmczdEVPS2kwUEB5dWtpLmxhbi8KPgo+ID4gPiArICAgICAgIC5uZWVkc19jZ3JvdXBfdmVyID0g
VFNUX0NHX1YxLAo+Cj4KPiA+IFRoZSB0ZXN0IGlzIGFsc28gdXNlZnVsIHRvIENHX1YyLCBzbyBs
ZXQncyByZW1vdmUgdGhpcyBsaW5lIGFzIHdlbGwuCj4KPiArMS4gVGhlIG9yaWdpbmFsIHNoZWxs
IHNjcmlwdCByZXF1aXJlZCB2MS4gQnV0IEMgQVBJIGFsbG93cyB0byB1c2UgYm90aC4KPgo+IEtp
bmQgcmVnYXJkcywKPiBQZXRyCj4KPgoKLS0gClJlZ2FyZHMsCkxpIFdhbmcKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
