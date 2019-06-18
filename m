Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A497E4A5D0
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jun 2019 17:49:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 766D73EAB58
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jun 2019 17:49:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 1D7603EA2BD
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 17:49:24 +0200 (CEST)
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BB97560085C
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 17:49:26 +0200 (CEST)
Received: by mail-yw1-xc41.google.com with SMTP id k128so6924584ywf.2
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 08:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dtfQUNNHf1+5MTIr2rtx85PbW9YqN3BWbmK/kDVB/H8=;
 b=Rwq5rNtRAEGwSDAkbwZuwzZtUKlJIvom0B/WexFp851USjBIp70+sgn12NgUUcCf5H
 SUzSQDuje/nAk3fs9GVnWbRZkC48wD7xsWUZ9ED1r2Gx6QEnarnL/gA7hrgl+uNM4TBE
 /PO1g/QfDpUhJpgWGodsE8JCzjFENAYG45nXZv5wpGkTClbrTFsbJKKGanPGgu/X5l3I
 SIK4aM+uZAEjRAVQT9V6uHdfe/a1ZH51CVdjBs+zpXrVdjN6JfTJoomOrdU5qjENl2TZ
 FgQFFN2q0VjipM2pxfECjAF2phUz50fnhMZ19htPsO0Jn6e53ketNffg0bbBDeJvHgaO
 EF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dtfQUNNHf1+5MTIr2rtx85PbW9YqN3BWbmK/kDVB/H8=;
 b=sCIngR1J49o32XB2Ula/CZnVDoaMfKQjRpisrHpr9cos4qECpGM2TfEr/EuSTNd7hM
 MXaYO0nZul5reO+vQKw04yneEK+joQoQPdg75pQ2EjhMIqYr8Lr1C2K+mDVDmy+TVJlW
 0Fa7V/gw3cm1ycBrnxxTGdD4JMHcRowFgOADgw6shlYcgBK3ogmWSYu3BtTV5dh1Kfof
 8xqE9Ud+4qp5z8hN7FUTCh6Lrx2H3Evu8456/QGLTVG/Ch5cabfZsP0kzNnFpTn0HhL9
 MElOZCfaj7nkIEFbFiM+ggQLTD0wqAM4nvS/Cw7PPsJPr0BQopU/AK+3KNH3R5sY02v9
 mj8Q==
X-Gm-Message-State: APjAAAXi3IwJpDWQjKYFFst5llEZKLv0Tbg/3DydnPMKZQXk/a8xIghH
 PEWRfVapQbAml3TRCKIMcV8VI83s0cfDsqsKG0Q=
X-Google-Smtp-Source: APXvYqxCt6wFn7FsERukoGgFsJfzgBeY8sFS7MYGsF5y+CbQ4KXdYpYd380UpQa+EjbHBIh6vO/B2lRejzRuhSfyDuM=
X-Received: by 2002:a81:50d5:: with SMTP id
 e204mr13061215ywb.379.1560872963012; 
 Tue, 18 Jun 2019 08:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <1560161596-30156-1-git-send-email-sumit.garg@linaro.org>
 <20190617150640.GD16831@rei>
In-Reply-To: <20190617150640.GD16831@rei>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 18 Jun 2019 18:49:11 +0300
Message-ID: <CAOQ4uxithmPn6J=B2kaGKT0JOpqzyVEkHU+zMqhXCYnnH+ZHVQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v4] syscalls/sync_file_range: add partial file
	sync test-cases
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

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgNjowNiBQTSBDeXJpbCBIcnViaXMgPGNocnViaXNAc3Vz
ZS5jej4gd3JvdGU6Cj4KPiBIaSEKPiBQdXNoZWQgd2l0aCBmb2xsb3dpbmcgbW9kaWZpY2F0aW9u
cywgdGhhbmtzLgo+Cj4gV2l0aCB0aGVzZSBtb2RpZmljYXRpb24gdGhlIHRlc3Qgd2FzIHN0YWJs
ZSBhbmQgd29ya2VkIGZpbmUgZm9yIG1vcmUKPiB0aGFuIDEwMCBpdGVyYXRpb25zIGZvciBtZS4g
SXQgc3RpbGwgZmFpbHMgZm9yIEZVU0UgYmFzZWQgZmlsZXN5c3RlbXMKPiBidXQgdGhhdCBpcyB0
byBiZSBleHBlY3RlZCBzaW5jZSBGVVNFIGRvZXMgbm90IGltcGxlbWVudCBzeW5jX2ZpbGVfcmFu
Z2UKPiB5ZXQuCj4KCldoYXQgaXMgdGhlIHByb3Bvc2VkIHdheSB0byByZXNvbHZlIHRoaXMgZmFp
bHVyZT8KSWYgRlVTRSBkb2VzIG5vdCBpbXBsZW1lbnQgc3luY19maWxlX3JhbmdlLCBzaG91bGRu
J3QgdGVzdCBkZXRlY3QKaXQgYW5kIHJldHVybiBUQ09ORj8KClRoYW5rcywKQW1pci4KCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
