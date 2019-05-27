Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BE82B624
	for <lists+linux-ltp@lfdr.de>; Mon, 27 May 2019 15:18:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ECC8F3EA9C2
	for <lists+linux-ltp@lfdr.de>; Mon, 27 May 2019 15:18:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 192383EA96D
 for <ltp@lists.linux.it>; Mon, 27 May 2019 15:18:07 +0200 (CEST)
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3CF581000A6A
 for <ltp@lists.linux.it>; Mon, 27 May 2019 15:18:03 +0200 (CEST)
Received: by mail-yb1-xb42.google.com with SMTP id s69so6418032ybi.2
 for <ltp@lists.linux.it>; Mon, 27 May 2019 06:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FpbhQs7a1f1vpGrVfxlxPP9dfpcpmlvn4Xb6hDKZzHI=;
 b=sXkSTgjzW6WifA9TUJa5wpmYb4uPCnabk44IIWIqw9IEW+0LrAo4RhtnFAr24KuTmI
 1vv5M8RM6eHljuCoP2lwUV76O+QZLqH273HWdllVdwWeiRZSvCWvVivModpU6hhd45yB
 NR6LfmF9NjMOCV6PvGKYaQU57zK3qvxCWLSpXr4u5+qB6pOOql5w79ESnYaZyx5OQS+C
 eW6BdF744wBS7NN9Ubt6QstguMBmsAJjDZf3h+raxg33wU2qWwRPsuk3lFw9oRjiL1Y6
 syIC9wfm5MH/KYjdkoQI9+73dmDKNiZBTsFlv9lL8zeWzZKik8lVZ4JX4OSoAYFaOrcq
 v4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FpbhQs7a1f1vpGrVfxlxPP9dfpcpmlvn4Xb6hDKZzHI=;
 b=i7U8SSVDZTjb/QAUm8RTDKiVVTgSYgTvTGQDXw3OSZz2h7KZxX3Npu5Lt2g2RHPbba
 gBvhY2y6cbDMhMmtkvs1S6syhortZuaTBhgsaM2cTI0/SfEMuuoThuCBXscIpVsV3KJE
 8w0ATJ4rFck0Z9CrMOW/8cbPynOdRgaEM1uU8J2f7MxL0PETXEfHBA8J4U3Z7C7NiQEX
 G5mudrVqy3se9vSVy0k9rMwhJmiM29hOPs1bKR4wu5p3SeJf6qE+mOzRzFYgbflLIqf5
 xCPtQZxywzg0hPnpRa8EPmxUi6qDcLfBGh51FoohW9kiXOdYWV/RS19ETPjWdZmTEWBc
 Gipw==
X-Gm-Message-State: APjAAAVflfNRtTyDs/MmZBGuT33OkFnJA9CYM2PYXolrWyGjjoDFA4jC
 aABVulDKjHsp+HxNEJGbfQeg18oa+V7dojuTFXs=
X-Google-Smtp-Source: APXvYqwYHup7iRZEjg/SfKTx/L0MyDwPUWRqmHma/lnEGI/pp0PK4jxDPMY2qovKYvwGTXnBxfaKMFOe1dA+kb+3Cjc=
X-Received: by 2002:a25:c983:: with SMTP id z125mr52349152ybf.45.1558963085320; 
 Mon, 27 May 2019 06:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190524122357.GA28108@dell5510>
 <20190525115112.15399-1-xzhou@redhat.com>
 <20190527120945.GA25513@dell5510>
In-Reply-To: <20190527120945.GA25513@dell5510>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 27 May 2019 16:17:53 +0300
Message-ID: <CAOQ4uxhwZkpTASn7Vn2sAE3uHcPupe19xwtsxLHixUYFxRiozQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v4 1/2] OVL_MNT: add helpers to setup overlayfs
	mountpoint
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

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMzowOSBQTSBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5j
ej4gd3JvdGU6Cj4KPiBIaSBNdXJwaHksIEFtaXIsIEN5cmlsLAo+Cj4ganVzdCBhIHN1Z2dlc3Rp
b24gdG8gYXBwbHkgZGlmZiBiZWxvdzoKPgo+IDEpIG1vdW50X292ZXJsYXkoKTogeW91IGRvbid0
IGFjdHVhbGx5IHVzZSBsaW5lbm8gYW5kIHNhZmUgaW4gZXJyb3IgbWVzc2FnZXMKPiB0c3RfZnNf
c2V0dXAuYzogSW4gZnVuY3Rpb24g4oCYbW91bnRfb3ZlcmxheeKAmToKPiB0c3RfZnNfc2V0dXAu
YzoyNjozMTogd2FybmluZzogdW51c2VkIHBhcmFtZXRlciDigJhmaWxl4oCZIFstV3VudXNlZC1w
YXJhbWV0ZXJdCj4gIGludCBtb3VudF9vdmVybGF5KGNvbnN0IGNoYXIgKmZpbGUsIGNvbnN0IGlu
dCBsaW5lbm8sIGludCBzYWZlKQo+ICAgICAgICAgICAgICAgICAgICB+fn5+fn5+fn5+fn5efn5+
Cj4gdHN0X2ZzX3NldHVwLmM6MjY6NDc6IHdhcm5pbmc6IHVudXNlZCBwYXJhbWV0ZXIg4oCYbGlu
ZW5v4oCZIFstV3VudXNlZC1wYXJhbWV0ZXJdCj4gIGludCBtb3VudF9vdmVybGF5KGNvbnN0IGNo
YXIgKmZpbGUsIGNvbnN0IGludCBsaW5lbm8sIGludCBzYWZlKQo+Cj4gMikgbW91bnRfb3Zlcmxh
eSgpOiByZXR1cm4gcmV0IGZyb20gbW91bnQgKHVzdWFsbHkgLTEpIGluc3RlYWQgb2YgMSAoaW4g
Y2FzZQo+IGFueWJvZHkgaXMgaW50ZXJlc3RlZCkuCj4KPiAzKSBtb3VudF9vdmVybGF5KCk6IGVh
cmxpZXIgcmV0dXJuIDAgYWZ0ZXIgY2hlY2tpbmcgRU5PREVWIHNhdmVzIHVzIG9uZSBzaGlmdAo+
IHJpZ2h0IChidXQgbWlnaHQgbG9vayBhcyBlcnJvciwgYXMgdHN0X3JlcygpIGlzIHVzdWFsbHkg
Zm9sbG93ZWQgYnkgcmV0dXJuKS4KPgo+IDQpIGNyZWF0ZV9vdmVybGF5X2RpcnMoKTogY2hlY2tz
IGZvciBPVkxfTE9XRVIgYW5kIHRodXMgY2FuIGJlIGNhbGxlZCBpbgo+IG1vdW50X292ZXJsYXko
KSB3aXRob3V0IGFueSBjaGVjay4gVGhpcyBzYXZlcyB1cyBjYWxsaW5nIGl0IGJlZm9yZQo+IHtT
QUZFLFRTVH1fTU9VTlRfT1ZFUkxBWSgpIGluIGV4ZWN2ZWF0MDMuYyBhbmQgcmVhZGFoZWFkMDIu
Ywo+Cj4gNSkgcmVtb3ZlZCB1bnVzZWQgaGVhZGVycyAoPHN0ZGludC5oPiwgPHN0ZGlvLmg+LCA8
c3RkbGliLmg+LCA8c3lzL3Zmcy5oPiksCj4gaXMgYW55IG9mIHRoZW0gbmVlZGVkIGFuZCB0aGUg
bmVlZCBtYXNrZWQgYnkgaXQncyBpbmNsdWRlIGluIHRzdF90ZXN0Lmg/Cj4KClRoZSBjaGFuZ2Vz
IGFib3ZlIGxvb2sgZmluZSB0byBtZQoKPiA1KSBvdGhlciBjbGVhbnVwCj4KPiBUT0RPOgo+IEkn
bSBzdGlsbCBub3Qgc3VyZSBhYm91dCBvdmxfbW91bnRlZC4gVGhlcmUgaXMgc3RhdGljIGludCBt
bnRwb2ludF9tb3VudGVkIGluCj4gbGliL3RzdF90ZXN0LmMsIHdoaWNoIGRvZXMgdW1vdW50LiAg
dHN0X3Rlc3QtPm1udHBvaW50LCBJIGd1ZXNzIHdlIHNob3VsZCB1c2UKPiBpdC4gV0RZVD8KCkl0
J3Mgbm90IGV4YWN0bHkgdGhlIHNhbWUgYXMgbW50cG9pbnRfbW91bnRlZC4KSW4gcmVhZGFoZWFk
MDIgb3ZsX21vdW50ZWQgaXMgdXNlZCB0byBkZWNpZGUgd2hldGhlciB0bwpydW4gdGVzdCBvbmx5
IG9uIGJhc2UgZnMgb3Igb24gYmFzZSBmcyBhbmQgYWxzbyBvbiBvdmVybGF5ZnMuCk9yIG1heWJl
IEkgZGlkIG5vdCB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4uCkZvciBvdGhlciB0ZXN0cyBvdmxf
bW91dG5lZCBpcyBvbmx5IHVzZWQgZm9yIGNsZWFudXAgYW5kIGNvdWxkCnByb2JhYmx5IGJlIHJl
cGxhY2VkIHdpdGggbW50cG9pbnRfbW91bnRlZC4KClRoYW5rcywKQW1pci4KCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
