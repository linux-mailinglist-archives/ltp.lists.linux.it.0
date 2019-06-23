Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7CD4FD3C
	for <lists+linux-ltp@lfdr.de>; Sun, 23 Jun 2019 19:14:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 724913EA9F9
	for <lists+linux-ltp@lfdr.de>; Sun, 23 Jun 2019 19:14:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C05013EA18F
 for <ltp@lists.linux.it>; Sun, 23 Jun 2019 19:13:59 +0200 (CEST)
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4258A140005B
 for <ltp@lists.linux.it>; Sun, 23 Jun 2019 19:13:58 +0200 (CEST)
Received: by mail-yw1-xc41.google.com with SMTP id k128so4911668ywf.2
 for <ltp@lists.linux.it>; Sun, 23 Jun 2019 10:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xw+9DTZUXtvWwIdhhsykHO7bFMJEDchuCfvV6BVcEgk=;
 b=frFeA/6qOd5P9bLrN85GWneVKUbKfNU1MUXHVwbU/Iq4kWXxljBxWB2b689EItVNLv
 dceK/QjuCL62bUk2i7YMlsstd/DZ3myjaWY4iWVuUYrYW72tvosMtM4fDvThw+H7hOM+
 7hOo1hTaf4m9yuIVOCaZlAFiQDchqhTh0NUDqTU2xC/d72T959dcI2u4HNzj6RBsR7no
 g3jGM16SyYbJ5G1AEIdLjxAQSAO2tE+N+nB1PZxVgJUbuDumzQIDoyoA558GqqcO7CSD
 TW7rXUxOv1DQVlHG/lABoBnoxS3lmAFyt7dJ7uEKN57RNaBRr3wcoYp5SLFjCeFnfEp3
 wXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xw+9DTZUXtvWwIdhhsykHO7bFMJEDchuCfvV6BVcEgk=;
 b=X6TU3QehWqah+4al27kY1TmATskozSuzhbtQ8tiR0a2L4vHipP5bqb0oe4pjxr6WWX
 2ILhq26g/eXWIJ8IJfNom8o8zYN1/ov9L1RtE0Q69yO0B+pyyeGxDCqw046b8Xzlf4dI
 UDpu7Md89ZD6ckwTTYOfzr7EXTPa3C+gkRM1zp20qZUomjXbCpnf4XTdNwcwubG5maD6
 46eNhjESu6Az0aZavU71EimpysU5Ez3cfD/fwKe3UKSOIV1zEoWfLcsZoZJE4y4/bA5P
 PsO/ZIAnxBQnhMZPeKvvsYXmLR0rE++iCznH7cLc6syO4QpOHURrTYaWrQLm22O60o4I
 eblA==
X-Gm-Message-State: APjAAAXZOyfhtQkGGtdj+q36VScp5l8nwiuoqvKfm/U6qR8MMhVGQp/O
 6YlGKf4o++/23IQ7iXQb1TCdBbCPD7VmXfmKzZU=
X-Google-Smtp-Source: APXvYqwJduTVh8gf+jvBosXhFM6m9Bm6p8w5o8jAcgkhxjUmfdyjxt74O3FihJvw6SdF7VAKCq58XfQEIGLTl7ZxItI=
X-Received: by 2002:a0d:db13:: with SMTP id d19mr62262982ywe.25.1561310036983; 
 Sun, 23 Jun 2019 10:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561018312.git.mbobrowski@mbobrowski.org>
 <98bc3a5d9591387964b913c497f930a11ea4f7a8.1561018312.git.mbobrowski@mbobrowski.org>
 <20190621140009.GA26200@rei.lan>
In-Reply-To: <20190621140009.GA26200@rei.lan>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 23 Jun 2019 20:13:45 +0300
Message-ID: <CAOQ4uxjUtmrAfjwxhSU3g3QJ-2Nk9795pdT=nd8Mza_ETo+_2g@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v5 2/4] syscalls/fanotify14: new test to validate
 FAN_REPORT_FID interface return values
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

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgNTowMCBQTSBDeXJpbCBIcnViaXMgPGNocnViaXNAc3Vz
ZS5jej4gd3JvdGU6Cj4KPiBIaSEKPiA+ICsjZWxzZQo+ID4gKyAgICAgVFNUX1RFU1RfVENPTkYo
IlN5c3RlbSBkb2VzIG5vdCBoYXZlIHJlcXVpcmVkIGZhbm90aWZ5IHN1cHBvcnQiKQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEkndmUgYWRkZWQKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG1pc3NpbmcKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNlbWljb2xvbiBoZXJlLgo+ID4gKyNl
bmRpZgo+Cj4gQW5kIGFwcGxpZWQgd2hvbGUgcGF0Y2hzZXQgdG9nZXRoZXIgd2l0aCB0aGUgZml4
IGZyb20gQW1pci4KPgoKSGkgQ3lyaWwsCgp2NSBzZXJpZXMgaGFzIDQgcGF0Y2hlcyBhbmQgSSBv
bmx5IHNlZSB5b3UgYXBwbGllZCB0aGUgMyBmaXJzdCBwYXRjaGVzLgpUaGlzIG9uZSB3YXMgbm90
IGFwcGxpZWQ6CgpzeXNjYWxscy9mYW5vdGlmeTEzOiBhZGQgdGVzdCBjb3ZlcmFnZSBmb3IgZnNp
ZCBjYWNoZSBidWcKClRoZSBleHRyYSBwYXRjaCBhZGRzIGNvdmVyYWdlIHRvIGEgYnVnIGZvdW5k
IHJvdW5kIHJjNSB0aW1lIHdob3NlCmZpeCB3YXMgbWVyZ2VkIHRvIGtlcm5lbCB2NS4yLXJjNjoK
YzI4NWEyZjAxZDY5IGZhbm90aWZ5OiB1cGRhdGUgY29ubmVjdG9yIGZzaWQgY2FjaGUgb24gYWRk
IG1hcmsKClRoYW5rcywKQW1pci4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK
