Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D6C47E24
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 11:18:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFF293EB0CE
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 11:18:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E06243EB065
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 11:18:25 +0200 (CEST)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 39EC3600EB2
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 11:18:25 +0200 (CEST)
Received: by mail-lj1-x242.google.com with SMTP id k18so8512885ljc.11
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 02:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IQpUNc9qrhmaasVo3soxalILZPEnz6CWgwWrYpBeKtA=;
 b=Z8HG7Lp3V1jnLDm3dtyFEn/+ltSs3X3SU2himALc/lWv/Vr0RSSYqLFDwVZbLYkPe1
 T21UF7oeHR2gN+1pe4YeFIdA7zqTGqDrebT1ae/xO2jTVPzuFgKkB4Ulm0kqWUyz0ODp
 gZnyGzmqLwSM/arrgK5JzUNxslHf+Dka7CayPF4ine6rUScUpq6XQZ01dtvYdkf+q8RS
 wz+FaTbdFdfOle4GcrGrG5mI4rGrNkr2YdKzup9HPiMPtCbc+NSwRPn3H9u3alurgqX3
 QWotG4AdcnrtB8R2NPVAtDi7YwAd51o+dtxx9V4cDeLjNZmJp0i+hBxAM4DrFMA8dWou
 RVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IQpUNc9qrhmaasVo3soxalILZPEnz6CWgwWrYpBeKtA=;
 b=cvGGwOwCjjASwV25ZmniItKGZDxVUXEJcXWfXVfm/3KpYRjQjOm6R508z6W3LGHoYh
 zzt3ATQE6XNzsGc7230rpU2OXFMjUIFTjcbTLRgTQMYifxUkNPIjMswCAAQMvIBxBXCo
 3XR3ReHkEfdb8i8GOntYpT5z4+eistYkZTkvAcx3wKxtu9oQzYFQqUhKMrSJpWQ7gdHc
 i9EpAaBFiXFs30V0ZTAhLvyvq5P7nq2mhd4wICPUf6FXyfHvzZcZUgyj2wNGaqfkdo6a
 MiBkszYTWaSqXKFFBAmdKGOt569n0M1H40/ZLMLllO2r3/gPg97HA9od/0emPmUQkyVn
 Av7Q==
X-Gm-Message-State: APjAAAXvDwP7Bx3Acvj2IzscG6FhQq/OKaBfC5Zo7hJVb+FiUJ6Av06G
 kA7q17pM3K7AaRlZQ+HruJGw5ImJU7d/XRRW+SozMg==
X-Google-Smtp-Source: APXvYqxCBDJIO798sKMaSNVsc9lyqlzZGTQf0QA5054hlglnqc0R/Lqwe2fCoaXs7/al9TJeIxs7jwytUuWljpuCj88=
X-Received: by 2002:a2e:4b12:: with SMTP id y18mr11673242lja.238.1560763104407; 
 Mon, 17 Jun 2019 02:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <ae6204b13cf5d2a8e2ebefd4ff448c33deeb26fd.1560756614.git.jstancek@redhat.com>
In-Reply-To: <ae6204b13cf5d2a8e2ebefd4ff448c33deeb26fd.1560756614.git.jstancek@redhat.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 17 Jun 2019 14:48:13 +0530
Message-ID: <CAFA6WYO5HqgkanPdzbVO84KDmnjKRo7AUiFp9QraBhkOeBLF5g@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: liwan@redhat.com, LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v2] syscalls/tgkill03: wait for defunct tid to get
	detached
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gTW9uLCAxNyBKdW4gMjAxOSBhdCAxMzowNCwgSmFuIFN0YW5jZWsgPGpzdGFuY2VrQHJlZGhh
dC5jb20+IHdyb3RlOgo+Cj4gQ2FzZSB3aGVyZSBkZWZ1bmN0IHRpZCBpcyB1c2VkIGhhcyBiZWVu
IG9ic2VydmVkIHRvIHNwb3JhZGljYWxseSBmYWlsOgo+ICAgdGdraWxsMDMuYzo5NjogRkFJTDog
RGVmdW5jdCB0aWQgc2hvdWxkIGhhdmUgZmFpbGVkIHdpdGggRVNSQ0g6IFNVQ0NFU1MKPgo+IGds
aWJjIF9fcHRocmVhZF90aW1lZGpvaW5fZXgoKSB3YWl0cyBmb3IgQ0xPTkVfQ0hJTERfQ0xFQVJU
SUQgdG8gY2xlYXIgdGlkLAo+IGFuZCB0aGVuIHJlc3VtZXMuIEtlcm5lbCBjbGVhcnMgaXQgKGds
aWJjIHBkLT50aWQpIGF0Ogo+ICAgZG9fZXhpdAo+ICAgICBleGl0X21tCj4gICAgICAgbW1fcmVs
ZWFzZQo+ICAgICAgICAgcHV0X3VzZXIoMCwgdHNrLT5jbGVhcl9jaGlsZF90aWQpOwo+Cj4gYnV0
IGtlcm5lbCB0aWQgaXMgc3RpbGwgdmFsaWQsIHByZXN1bWFibHkgdW50aWw6Cj4gICByZWxlYXNl
X3Rhc2sKPiAgICAgX19leGl0X3NpZ25hbAo+ICAgICAgIF9fdW5oYXNoX3Byb2Nlc3MKPiAgICAg
ICAgIGRldGFjaF9waWQKPgo+IFRvIGF2b2lkIHJhY2Ugd2FpdCB1bnRpbCAvcHJvYy88cGlkPi90
YXNrLzx0aWQ+IGRpc2FwcGVhcnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gU3RhbmNlayA8anN0
YW5jZWtAcmVkaGF0LmNvbT4KClRoYW5rcyBmb3IgdGhpcyBmaXguCgpBY2tlZC1ieTogU3VtaXQg
R2FyZyA8c3VtaXQuZ2FyZ0BsaW5hcm8ub3JnPgoKCi1TdW1pdAoKPiAtLS0KPiAgdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy90Z2tpbGwvdGdraWxsMDMuYyB8IDYgKysrKystCj4gIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IENoYW5nZXMgaW4gdjI6
Cj4gICAtIHVzZSBoZWxwZXIgZnVuYyBzdWdnZXN0ZWQgYnkgTGkgKHdpdGggaGlnaGVyIHRpbWVv
dXQpCj4gICAtIG5vdCB0ZXN0ZWQsIHRyeWluZyB0byBnZXQgczM5MHggdG8gY29uZmlybQo+Cj4g
ZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvdGdraWxsL3Rna2lsbDAzLmMg
Yi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3Rna2lsbC90Z2tpbGwwMy5jCj4gaW5kZXggZjVi
YmRjNWE4ZDRlLi5jZTA0NmY1NzZiNWYgMTAwNjQ0Cj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy90Z2tpbGwvdGdraWxsMDMuYwo+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvdGdraWxsL3Rna2lsbDAzLmMKPiBAQCAtNyw2ICs3LDcgQEAKPgo+ICAjaW5jbHVkZSA8cHRo
cmVhZC5oPgo+ICAjaW5jbHVkZSA8cHdkLmg+Cj4gKyNpbmNsdWRlIDxzdGRpby5oPgo+ICAjaW5j
bHVkZSA8c3lzL3R5cGVzLmg+Cj4KPiAgI2luY2x1ZGUgInRzdF9zYWZlX3B0aHJlYWQuaCIKPiBA
QCAtNDIsNiArNDMsNyBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQo+ICB7Cj4gICAgICAgICBz
aWdzZXRfdCBzaWd1c3IxOwo+ICAgICAgICAgcHRocmVhZF90IGRlZnVuY3RfdGhyZWFkOwo+ICsg
ICAgICAgY2hhciBkZWZ1bmN0X3RpZF9wYXRoW1BBVEhfTUFYXTsKPgo+ICAgICAgICAgc2lnZW1w
dHlzZXQoJnNpZ3VzcjEpOwo+ICAgICAgICAgc2lnYWRkc2V0KCZzaWd1c3IxLCBTSUdVU1IxKTsK
PiBAQCAtNTUsOCArNTcsOSBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQo+ICAgICAgICAgVFNU
X0NIRUNLUE9JTlRfV0FJVCgwKTsKPgo+ICAgICAgICAgU0FGRV9QVEhSRUFEX0NSRUFURSgmZGVm
dW5jdF90aHJlYWQsIE5VTEwsIGRlZnVuY3RfdGhyZWFkX2Z1bmMsIE5VTEwpOwo+IC0KPiAgICAg
ICAgIFNBRkVfUFRIUkVBRF9KT0lOKGRlZnVuY3RfdGhyZWFkLCBOVUxMKTsKPiArICAgICAgIHNw
cmludGYoZGVmdW5jdF90aWRfcGF0aCwgIi9wcm9jLyVkL3Rhc2svJWQiLCBnZXRwaWQoKSwgZGVm
dW5jdF90aWQpOwo+ICsgICAgICAgVFNUX1JFVFJZX0ZOX0VYUF9CQUNLT0ZGKGFjY2VzcyhkZWZ1
bmN0X3RpZF9wYXRoLCBSX09LKSwgLTEsIDE1KTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIGNsZWFu
dXAodm9pZCkKPiBAQCAtMTA4LDQgKzExMSw1IEBAIHN0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVz
dCA9IHsKPiAgICAgICAgIC5zZXR1cCA9IHNldHVwLAo+ICAgICAgICAgLmNsZWFudXAgPSBjbGVh
bnVwLAo+ICAgICAgICAgLnRlc3QgPSBydW4sCj4gKyAgICAgICAudGltZW91dCA9IDE1LAo+ICB9
Owo+IC0tCj4gMS44LjMuMQo+Cj4KPiAtLQo+IE1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
