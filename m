Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0859A39FF
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2024 11:31:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A4573C6549
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2024 11:31:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 792CC3C6394
 for <ltp@lists.linux.it>; Fri, 18 Oct 2024 11:31:19 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwan@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 86D551413E67
 for <ltp@lists.linux.it>; Fri, 18 Oct 2024 11:31:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729243876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gp2RpJw9dBtw1v6NfNivVTnTnlycloIrRDbqeMjSM/0=;
 b=ZLXKum1Sqa5kKx8u1ycYI74kpy4jy2BXsoHqunGB8sWK3KP2NIwtz62IVw15kynUuUDdVQ
 z5Sm/MhvQCaIzAcY3D3l9kEI9fywhdEJVIZxys0vHSoTABYI3RjGC+1fkMdt0gWjBNn6gy
 v0dRhx0Ckul6yCIwuwn3eGdvP9pgUw8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-3emnMwiKPVWf3l9PPD9ODQ-1; Fri, 18 Oct 2024 05:31:15 -0400
X-MC-Unique: 3emnMwiKPVWf3l9PPD9ODQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2e2dbda65e7so2200353a91.0
 for <ltp@lists.linux.it>; Fri, 18 Oct 2024 02:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729243873; x=1729848673;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gp2RpJw9dBtw1v6NfNivVTnTnlycloIrRDbqeMjSM/0=;
 b=MUhduVZxOMYeeHFQNi6dQMY0mKzrmhGkCWRvFO8jzlGG+2ccxsSHvl9UnfjKmmsstS
 HMAtm9N2dyyPLzgpvx4MS5K6mXa0tccviyuntkjYswv45svZaYndVi3HZR/gcK3znZ9C
 nRggQdlA7nNi7bOIKanl2LebRyU45UNDBGMt7JGud7HpjXlLji/7CnFhi99e+pxDSZLd
 OrMwBHjS6MB5rHW0YDr3qtSIRhEvJV1/GO0KQ6u6zFhgfdPV8i92AWgsUTkW2BPHlTDO
 GwD9+xNAMIb2ncUNhH+UQJrmF4AK8AOHm+rNFfAIjugIdH67JPRJ9cDR5aWYkTkFcLtu
 o9QQ==
X-Gm-Message-State: AOJu0YwSGcV7Hn+4PIT9QCLmaj7J1uTrqqMaYYicJRmj9IR9XqGFUKVT
 rOFksXOBnLncSFDRUfHJvdhNf7O96YgsR2RX9s5DYElOPnipwgIiqzPpQSu6eoMB/CfEEbXNDzY
 TZv+KnJBtUKDFB+Mu0rbUvp7So4EvJxWS2RhUZ6PdVvE9JyL4IrA09BsbMrm3zpvKwhIOZlsPkZ
 Z7eMCilDjWOFH7nOMtn9TfVWLA2WGuWbS71X/1
X-Received: by 2002:a17:90a:1157:b0:2e2:d87f:3cc with SMTP id
 98e67ed59e1d1-2e5617571eamr2270437a91.23.1729243873469; 
 Fri, 18 Oct 2024 02:31:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1lPBzLTzK3lMGXJQ+Ol/FFoL8TyuBxsNVY5HzYtp9pvstLUAOZXwNeyhozsLDQTOG9ISqftcXMvRYDO9vZog=
X-Received: by 2002:a17:90a:1157:b0:2e2:d87f:3cc with SMTP id
 98e67ed59e1d1-2e5617571eamr2270412a91.23.1729243873058; Fri, 18 Oct 2024
 02:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240913134036.12078-1-spoorthy@linux.ibm.com>
In-Reply-To: <20240913134036.12078-1-spoorthy@linux.ibm.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 18 Oct 2024 17:31:00 +0800
Message-ID: <CAEemH2doMF7EggO_TOP+y=WwS75aXxrFA8mfaZmr-+YWwB1JSQ@mail.gmail.com>
To: Spoorthy <spoorthy@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH v3] Hugetlb: Migrating libhugetlbfs shm-perms
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

SGkgU3Bvb3J0aHksCgpPbiBGcmksIFNlcCAxMywgMjAyNCBhdCA5OjQx4oCvUE0gU3Bvb3J0aHkg
PHNwb29ydGh5QGxpbnV4LmlibS5jb20+IHdyb3RlOgoKPiBUZXN0IERlc2NyaXB0aW9uOiBUZXN0
cyB0aGUgYmVoYXZpb3Igb2Ygc2hhcmVkIG1lbW9yeSB3aGVuCj4gbXVsdGlwbGUgdGhyZWFkcyBh
dHRhY2ggdG8gYSBzZWdtZW50IHdpdGggZGlmZmVyZW50IHBlcm1pc3Npb25zLgo+Cj4gQXQgb25l
IHBvaW50LCByZXNlcnZhdGlvbiBhY2NvdW50aW5nIG9mIGZyZWUgaHVnZXBhZ2VzIGJldHdlZW4g
dGhlIHBhcmVudAo+IGFuZCBjaGlsZCBwcm9jZXNzZXMgbWF5IGJlY29tZSBpbmNvbnNpc3RlbnQg
ZHVyaW5nIG1lbW9yeSBvcGVyYXRpb25zLgo+IFRoZSBwYXJlbnQgY3JlYXRlcyA0IGh1Z2VwYWdl
cyBhbmQgYSBzaGFyZWQgbWVtb3J5IHNlZ21lbnQKPiAoc2l6ZSBzZWdtZW50X3NpemUsIHBlcm1p
c3Npb24gMDY0MCksIGF0dGFjaGVzIGl0LCBhbmQgaW5pdGlhbGl6ZXMKPiBmb3VyIHBhcnRzIHdp
dGggYSBwYXR0ZXJuICgweDU1KSwgdGhlbiBkZXRhY2hlcyBpdC4gQ2hpbGQgcHJvY2Vzc2VzCj4g
YXJlIGNyZWF0ZWQgaW4gYSBsb29wLCBlYWNoIHJlYXR0YWNoaW5nIHRoZSBzZWdtZW50IGluIHJl
YWQtb25seSBtb2RlCj4gd2l0aCBTSE1fUkRPTkxZLCBkZXRhY2hpbmcsIGFuZCBleGl0aW5nLiBJ
ZiBhdHRhY2gvZGV0YWNoIGZhaWxzIG9yCj4gaWYgdGhlIHJlc2VydmF0aW9uIGFjY291bnRpbmcg
b2YgZnJlZSBodWdlcGFnZXMgZG9lc24ndCBtYXRjaAo+IGJldHdlZW4gcGFyZW50IGFuZCBjaGls
ZCwgdGhlIHRlc3QgZmFpbHMuIElmIGFsbCBjaGlsZCBwcm9jZXNzZXMgZXhpdAo+IHN1Y2Nlc3Nm
dWxseSBhbmQgYWNjb3VudGluZyBtYXRjaGVzLCB0aGUgdGVzdCBwYXNzZXMuCj4KPiBUZXN0ZWQg
YW5kIHZlcmlmaWVkIHRoZSBzdWNjZXNzIG9mIHRlc3QgY2FzZQo+Cj4gU2lnbmVkLW9mZi1ieTog
U3Bvb3J0aHkgPHNwb29ydGh5QGxpbnV4LmlibS5jb20+Cj4gLS0tCj4gIHJ1bnRlc3QvaHVnZXRs
YiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgdGVzdGNhc2VzL2tlcm5l
bC9tZW0vLmdpdGlnbm9yZSAgICAgICAgICAgICAgIHwgIDEgKwo+ICAuLi4vbWVtL2h1Z2V0bGIv
aHVnZXNobWF0L2h1Z2VzaG1hdDA2LmMgICAgICAgfCA5NyArKysrKysrKysrKysrKysrKysrCj4g
IDMgZmlsZXMgY2hhbmdlZCwgOTkgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
dGVzdGNhc2VzL2tlcm5lbC9tZW0vaHVnZXRsYi9odWdlc2htYXQvaHVnZXNobWF0MDYuYwo+Cj4g
ZGlmZiAtLWdpdCBhL3J1bnRlc3QvaHVnZXRsYiBiL3J1bnRlc3QvaHVnZXRsYgo+IGluZGV4IDI5
OWMwN2FjOS4uMjQwNzAxYjJiIDEwMDY0NAo+IC0tLSBhL3J1bnRlc3QvaHVnZXRsYgo+ICsrKyBi
L3J1bnRlc3QvaHVnZXRsYgo+IEBAIC00NCw2ICs0NCw3IEBAIGh1Z2VzaG1hdDAyIGh1Z2VzaG1h
dDAyIC1pIDUKPiAgaHVnZXNobWF0MDMgaHVnZXNobWF0MDMgLWkgNQo+ICBodWdlc2htYXQwNCBo
dWdlc2htYXQwNCAtaSA1Cj4gIGh1Z2VzaG1hdDA1IGh1Z2VzaG1hdDA1IC1pIDUKPiAraHVnZXNo
bWF0MDYgaHVnZXNobWF0MDYKPgo+ICBodWdlc2htY3RsMDEgaHVnZXNobWN0bDAxIC1pIDUKPiAg
aHVnZXNobWN0bDAyIGh1Z2VzaG1jdGwwMiAtaSA1Cj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9r
ZXJuZWwvbWVtLy5naXRpZ25vcmUKPiBiL3Rlc3RjYXNlcy9rZXJuZWwvbWVtLy5naXRpZ25vcmUK
PiBpbmRleCBjOTZmZThiZmMuLjRhZDFkYzMxMyAxMDA2NDQKPiAtLS0gYS90ZXN0Y2FzZXMva2Vy
bmVsL21lbS8uZ2l0aWdub3JlCj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9tZW0vLmdpdGlnbm9y
ZQo+IEBAIC0zOSw2ICszOSw3IEBACj4gIC9odWdldGxiL2h1Z2VzaG1hdC9odWdlc2htYXQwMwo+
ICAvaHVnZXRsYi9odWdlc2htYXQvaHVnZXNobWF0MDQKPiAgL2h1Z2V0bGIvaHVnZXNobWF0L2h1
Z2VzaG1hdDA1Cj4gKy9odWdldGxiL2h1Z2VzaG1hdC9odWdlc2htYXQwNgo+ICAvaHVnZXRsYi9o
dWdlc2htY3RsL2h1Z2VzaG1jdGwwMQo+ICAvaHVnZXRsYi9odWdlc2htY3RsL2h1Z2VzaG1jdGww
Mgo+ICAvaHVnZXRsYi9odWdlc2htY3RsL2h1Z2VzaG1jdGwwMwo+IGRpZmYgLS1naXQgYS90ZXN0
Y2FzZXMva2VybmVsL21lbS9odWdldGxiL2h1Z2VzaG1hdC9odWdlc2htYXQwNi5jCj4gYi90ZXN0
Y2FzZXMva2VybmVsL21lbS9odWdldGxiL2h1Z2VzaG1hdC9odWdlc2htYXQwNi5jCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAuLmJjYjMxYjFkNAo+IC0tLSAvZGV2L251
bGwKPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL21lbS9odWdldGxiL2h1Z2VzaG1hdC9odWdlc2ht
YXQwNi5jCj4gQEAgLTAsMCArMSw5NyBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vci1sYXRlcgo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMDUtMjAwNiwgSUJN
IENvcnBvcmF0aW9uLgo+ICsgKiBBdXRob3I6IERhdmlkIEdpYnNvbiAmIEFkYW0gTGl0a2UKPiAr
ICovCj4gKy8qXAo+ICsgKiBbREVTQ1JJUFRJT05dCj4gKyAqIFRlc3Qgc2hhcmVkIG1lbW9yeSBi
ZWhhdmlvciB3aGVuIG11bHRpcGxlIHRocmVhZHMgYXJlIGF0dGFjaGVkCj4gKyAqIHRvIGEgc2Vn
bWVudCB3aXRoIGRpZmZlcmVudCBwZXJtaXNzaW9ucy4gIEEgc2VnbWVudCBpcyBjcmVhdGVkCj4g
KyAqIGFuZCBjaGlsZHJlbiBhdHRhY2ggcmVhZC1vbmx5IHRvIGNoZWNrIHJlc2VydmF0aW9uIGFj
Y291bnRpbmcuCj4gKyAqLwo+ICsKPiArI2luY2x1ZGUgImh1Z2V0bGIuaCIKPiArI2luY2x1ZGUg
InRzdF9zYWZlX3N5c3ZfaXBjLmgiCj4gKwo+ICsjZGVmaW5lIFNFR01FTlRfS0VZICgweDgyYmEx
NWZmKQo+ICsjZGVmaW5lIE1OVFBPSU5UICJodWdldGxiZnMvIgo+ICsjZGVmaW5lIEhQQUdFU19J
Tl9TRUdNRU5UIDQKPiArCj4gK3N0YXRpYyBpbnQgZ2xvYmFsX3NobWlkID0gLTE7Cj4gK3N0YXRp
YyB2b2lkICpzaG1hZGRyOwo+ICtzdGF0aWMgbG9uZyBzZWdtZW50X3NpemUsIGhwYWdlX3NpemUs
IHN0cmlkZTsKPiArCj4gK3N0YXRpYyBpbnQgYXR0YWNoX3NlZ21lbnQoc2l6ZV90IHNlZ3NpemUs
IGludCBzaG1mbGFncywgaW50IHNobXBlcm1zKQo+ICt7Cj4gKyAgICAgICBpbnQgc2htaWQ7Cj4g
Kwo+ICsgICAgICAgc2htaWQgPSBTQUZFX1NITUdFVChTRUdNRU5UX0tFWSwgc2Vnc2l6ZSwgc2ht
ZmxhZ3MpOwo+ICsgICAgICAgc2htYWRkciA9IFNBRkVfU0hNQVQoc2htaWQsIHNobWFkZHIsIHNo
bXBlcm1zKTsKPiArICAgICAgIGdsb2JhbF9zaG1pZCA9IHNobWlkOwo+ICsgICAgICAgcmV0dXJu
IHNobWlkOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQo+ICt7Cj4gKyAgICAg
ICBocGFnZV9zaXplID0gdHN0X2dldF9odWdlcGFnZV9zaXplKCk7Cj4gKyAgICAgICBzZWdtZW50
X3NpemUgPSA0ICogaHBhZ2Vfc2l6ZTsKPiArICAgICAgIHN0cmlkZSA9IGhwYWdlX3NpemU7Cj4g
K30KPiArCj4gK3N0YXRpYyB2b2lkIGNvbXBhcmVfZnJlZV9odWdlcGFnZV9tZW1vcnkobG9uZyBm
cmVlX2VuZCwgbG9uZyBmcmVlX3N0YXJ0KQo+ICt7Cj4gKyAgICAgICBpZiAoZnJlZV9lbmQgIT0g
ZnJlZV9zdGFydCkKPiArICAgICAgICAgICAgICAgdHN0X3JlcyhURkFJTCwgIkZyZWUgaHVnZXBh
Z2VzIGFmdGVyIGF0dGFjaGluZyBtdWx0aXBsZQo+IHRocmVhZHMgZGlmZmVyIGZyb20gaW5pdGlh
bCBhbGxvY2F0aW9uIik7Cj4KCldlIGNhbm5vdCBtYWtlIHN1Y2ggYW4gYXNzdW1wdGlvbiBmb3Ig
VEZBSUwgYmVjYXVzZSB0aGUgc3lzdGVtCm1heSBiZSB1c2luZyBodWdlcGFnZXMgaW4gdGhlIGJh
Y2tncm91bmQgYnkgb3RoZXIgcHJvY2Vzc2VzLCBhbmQKdGhpcyB0ZXN0IGlzIG5vdCBhbG9uZSBp
biBvY2N1cHlpbmcgaHVnZSBwYWdlIHNvIHRoYXQgd291bGQgYmUgcG9zc2libGUKZ2V0IGZhbHNl
IHBvc2l0aXZlIGluIHRoZSByZWFsIHRlc3RpbmcuCgoKCgo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9p
ZCBydW5fdGVzdCh2b2lkKQo+ICt7Cj4gKyAgICAgICBjaGFyICpwOwo+ICsgICAgICAgaW50IGks
IGl0ZXJhdGlvbnM7Cj4gKyAgICAgICBsb25nIHRvdGFsX2hwYWdlcywgZnJlZV9zdGFydCwgZnJl
ZV9lbmQsIHZhbDsKPiArCj4gKyAgICAgICB0b3RhbF9ocGFnZXMgPSBTQUZFX1JFQURfTUVNSU5G
TyhNRU1JTkZPX0hQQUdFX1RPVEFMKTsKPgoKSWYgd2Ugc2V0IG51bSBpbiB0aGUgdHN0X3Rlc3Qt
Pmh1Z2VwYWdlcyBhdCB0aGUgYmVnaW5uaW5nLAondHN0X2h1Z2VwYWdlcycgY2FuIGJlIHVzZWQg
ZGlyZWN0bHkgc2luY2UgbHRwLWxpYiBhbHJlYWR5CnNhdmVkIHRoZSByZXNlcnZlZCBocGFnZSBu
dW1iZXJzLgoKCgo+ICsgICAgICAgaXRlcmF0aW9ucyA9ICh0b3RhbF9ocGFnZXMgKiBocGFnZV9z
aXplKSAvIHNlZ21lbnRfc2l6ZSsxOwo+CgpUaGlzIGlzIG5vdCBhIGdvb2QgaWRlYSBmb3IgdGhl
IGl0ZXJhdGlvbnMgY291bnRpbmcsIGJlY2F1c2UgcmVzZXJ2aW5nCjMyIEhQQUdFUyBpcyBzbyBs
dXh1cmlvdXMgc2luY2Ugd2Ugb25seSBuZWVkIDQgaW4gdGhlIHRlc3QuCgpNYXliZSB3ZSBjYW4g
Y291bnQgdGhlIGl0ZXJhdGlvbnMgYWNjb3JkaW5nIHRvIHRoZSBzeXN0ZW0gY3B1cz8KSWYgdGhl
IHN5c3RlbSBpcyB0b28gbGFyZ2UsIG9ubHkgc2V0IGFuIGFjY2VwdGFibGUgdXAtbGltaXQgbnVt
IChlLmcgMTI4KS4KCgoKPiArICAgICAgIGF0dGFjaF9zZWdtZW50KHNlZ21lbnRfc2l6ZSwgSVBD
X0NSRUFUIHwgU0hNX0hVR0VUTEIgfCAwNjQwLCAwKTsKPiArICAgICAgIHAgPSAoY2hhciAqKXNo
bWFkZHI7Cj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgNDsgaSsrLCBwICs9IHN0cmlkZSkKPiAr
ICAgICAgICAgICAgICAgbWVtc2V0KHAsIDB4NTUsIHN0cmlkZSk7Cj4gKyAgICAgICBmcmVlX3N0
YXJ0ID0gU0FGRV9SRUFEX01FTUlORk8oTUVNSU5GT19IUEFHRV9GUkVFKTsKPiArICAgICAgIFNB
RkVfU0hNRFQoKGNvbnN0IHZvaWQgKilzaG1hZGRyKTsKPiArICAgICAgIGZvciAoaSA9IDA7IGkg
PCBpdGVyYXRpb25zOyBpKyspIHsKPgoKTW92ZSB0aGUgJ3ZhbCcgZGVjbGFyZSBoZXJlIGJ1dCBu
b3QgaW4gdGhlIHBhcmVudC4KCisgICAgICAgICAgICAgICBwaWRfdCBwaWQ7Cj4gKwo+ICsgICAg
ICAgICAgICAgICBwaWQgPSBTQUZFX0ZPUksoKTsKPiArICAgICAgICAgICAgICAgaWYgKCFwaWQp
IHsKPiArICAgICAgICAgICAgICAgICAgICAgICBhdHRhY2hfc2VnbWVudCgwLCAwLCBTSE1fUkRP
TkxZKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgSFBBR0VTX0lO
X1NFR01FTlQ7IGkrKykKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZhbCA9ICoo
KGNoYXIgKilzaG1hZGRyICsgKGkgKgo+IGhwYWdlX3NpemUpKTsKPgoKSSB3b3VsZCBzdWdnZXN0
IHByaW50aW5nIHNvbWV0aGluZyBoZXJlIHRvIHNob3cgdGhlIGNoaWxkJ3MgYmVoYXZpb3I6Cgog
IHRzdF9yZXMoVElORk8sICJDaGlkICVkIGF0dGFjaHMgdGhlIHNlZ21lbnQgc3VjY2Vzc2Z1bHki
LCBnZXRwaWQoKSk7CgoKCj4gKyAgICAgICAgICAgICAgICAgICAgICAgU0FGRV9TSE1EVCgoKGNv
bnN0IHZvaWQgKilzaG1hZGRyKSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZnJlZV9lbmQg
PSBTQUZFX1JFQURfTUVNSU5GTyhNRU1JTkZPX0hQQUdFX0ZSRUUpOwo+CgoKPiArICAgICAgICAg
ICAgICAgICAgICAgICBjb21wYXJlX2ZyZWVfaHVnZXBhZ2VfbWVtb3J5KGZyZWVfZW5kLCBmcmVl
X3N0YXJ0KTsKPgoKUHJvYmFibHkgYSBzYWZlIHdheSBpcyB0byBjaGVjayB0aGUgY29udGVudHMg
b2Ygc2hhcmVkIG1lbW9yeSBhcmUgY29ycmVjdCwKc2luY2UgQ2hpbGRyZW4gb25seSBoYXZlIFJF
QUQgcGVybWlzc2lvbi4KCgo+ICsgICAgICAgICAgICAgICAgICAgICAgIGV4aXQoRVhJVF9TVUND
RVNTKTsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgfQo+ICsgICAgICAgZnJlZV9lbmQg
PSBTQUZFX1JFQURfTUVNSU5GTyhNRU1JTkZPX0hQQUdFX0ZSRUUpOwo+ICsgICAgICAgY29tcGFy
ZV9mcmVlX2h1Z2VwYWdlX21lbW9yeShmcmVlX2VuZCwgZnJlZV9zdGFydCk7Cj4gKyAgICAgICB0
c3RfcmVhcF9jaGlsZHJlbigpOwo+ICsgICAgICAgdHN0X3JlcyhUUEFTUywgIlN1Y2Nlc3NmdWxs
eSB0ZXN0ZWQgc2hhcmVkIG1lbW9yeSBiZWhhdmlvciB3aGVuCj4gbXVsdGlwbGUgdGhyZWFkcyBh
cmUgYXR0YWNoZWQiKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgY2xlYW51cCh2b2lkKQo+ICt7
Cj4gKyAgICAgICBpZiAoZ2xvYmFsX3NobWlkID49IDApCj4gKyAgICAgICAgICAgICAgIFNBRkVf
U0hNQ1RMKGdsb2JhbF9zaG1pZCwgSVBDX1JNSUQsIE5VTEwpOwo+ICt9Cj4gKwo+ICtzdGF0aWMg
c3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7Cj4gKyAgICAgICAubmVlZHNfcm9vdCA9IDEsCj4gKyAg
ICAgICAubW50cG9pbnQgPSBNTlRQT0lOVCwKPiArICAgICAgIC5uZWVkc19odWdldGxiZnMgPSAx
LAo+ICsgICAgICAgLm5lZWRzX3RtcGRpciA9IDEsCj4gKyAgICAgICAuZm9ya3NfY2hpbGQgPSAx
LAo+ICsgICAgICAgLnNldHVwID0gc2V0dXAsCj4gKyAgICAgICAuY2xlYW51cCA9IGNsZWFudXAs
Cj4gKyAgICAgICAudGVzdF9hbGwgPSBydW5fdGVzdCwKPiArICAgICAgIC5odWdlcGFnZXMgPSB7
MzIsIFRTVF9ORUVEU30sCj4KCldoeSByZXF1ZXN0IDMyIGhwYWdlcz8gSW4gdGhlIGFib3ZlIHRl
c3QgYXMgZmFyIGFzIEkgY2FuIHNlZSBvbmx5IDQgaXMKZW5vdWdoLgoKK307Cj4gLS0KPiAyLjQz
LjAKPgo+Cj4gLS0KPiBNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAKPgo+CgotLSAKUmVnYXJkcywKTGkgV2FuZwoKLS0gCk1haWxpbmcgbGlzdCBp
bmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
