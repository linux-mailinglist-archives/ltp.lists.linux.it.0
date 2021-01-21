Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6F52FEEF5
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 16:35:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 025E63C75FD
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 16:35:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 3E70D3C3040
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 16:35:41 +0100 (CET)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6910A60128D
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 16:35:36 +0100 (CET)
Received: by mail-pg1-x529.google.com with SMTP id q7so1579778pgm.5
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 07:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=H6EpQkeTHQN+1PzlepZ/FolVD/XFWFpfEVHJCsLKIac=;
 b=oxx2MtScZLUN+EktOnmCR1xuWEaGSeebaAg2+gi80ZMBWKhIXfLJcLUMFIS1a3nenT
 gs5HxTuGbJw5GrKsMrUiLhx9XSGhVmoWsCuc8vbUlqj8lcUbkKQbd6o3JmYLIq/a04xa
 gfX3gkdXmcWEx1HiM7HLQMeGdM4+soOQhaq0d0mdKajpybhMg9QNYEeymDmNqU87Rxi2
 N1+FCXsZMF3rQUperdaeeNfnYa+8L4apecNRTGQ5nuR4Nup6sKB1XkEx8uDP2MiQJGlD
 UD9miSe3WbDMXOvdo4MfpfhxWAd5Yqx/HvI9oJ21wGKhKCyxd6RMs6ca+AshjjsVCH2L
 JWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=H6EpQkeTHQN+1PzlepZ/FolVD/XFWFpfEVHJCsLKIac=;
 b=TfINdFWGwN/47BrPkcVPMwh4YzOre0UMtf8AGOZm+syZUc65hWI79Bv9vjvmtjfqik
 QxXrtpqdPVY+0fbYV5q6ZOHgeyg9twDpHCVWxAmKUkLIkv/pwdgG45bzzvWW1sj7uM0u
 FMtRC2KcRYWa7NQvjesRzc4+bjWdEX/dLarTp/8glc6qV+5V4e48JILw3bFr8XJR5+eI
 ZwjvVsAWJ2QIYaSgcfpb7mDBB+EuqU//fV4wc2tnmyOX/N/dQZ4CgWTc0lMGR/Wox1kV
 AiGyJEOi79vVSVjR6goJznavl3RmJOcGYh0KSGWqF5ZsylVG7ctNCJoXXp6wAWV7L+ip
 yZkQ==
X-Gm-Message-State: AOAM530Tlx/6RzgCl7zTU/5k5Ev0um2A+NL0MRUWe3uyhzZuXKDm5Eiv
 rDcjAVdlwxisHaVmXZTqSRJn/kJY/sNvyQ==
X-Google-Smtp-Source: ABdhPJxw3M/UndRSN1c8XbkLr4SrYm0d/bRtp6oDWOYZMN/LVH05MHvN97tszYvdjuHqV3nPyvPNMQ==
X-Received: by 2002:a62:686:0:b029:1ba:84ad:5839 with SMTP id
 128-20020a6206860000b02901ba84ad5839mr9763597pfg.65.1611243334636; 
 Thu, 21 Jan 2021 07:35:34 -0800 (PST)
Received: from ?IPv6:2607:fb90:b278:27b1:edf9:d0a:5ce:1e3?
 ([2607:fb90:b278:27b1:edf9:d0a:5ce:1e3])
 by smtp.gmail.com with ESMTPSA id a131sm6132595pfd.171.2021.01.21.07.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 07:35:33 -0800 (PST)
From: Enji Cooper <yaneurabeya@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 21 Jan 2021 07:35:32 -0800
Message-Id: <1157B504-C0F4-421B-B91F-B58692D6A9C7@gmail.com>
References: <20210121102239.18643-1-pvorel@suse.cz>
In-Reply-To: <20210121102239.18643-1-pvorel@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
X-Mailer: iPhone Mail (18C66)
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] configure.ac: More descriptive NUMA error
 message
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
Cc: Donghai Qiao <dqiao@redhat.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

VHlwbzog4oCcaXTigJlz4oCdIHNob3VsZCBiZSDigJxpdHPigJ0uIE90aGVyd2lzZSwgc2hpcCBp
dCEKClJldmlld2VkLWJ5OiBFbmppIENvb3BlciA8eWFuZXVyYWJleWFAZ21haWwuY29tPgoKPiBP
biBKYW4gMjEsIDIwMjEsIGF0IDAyOjIzLCBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4gd3Jv
dGU6Cj4gCj4g77u/U29tZSBwZW9wbGUgd2VyZSBjb25mdXNlZCBhbmQgc2VhcmNoZWQgZm9yIGxp
Ym51bWEuc28uMiwKPiB3aGljaCBkb2VzIG5vdCBleGlzdC4KPiAKPiBSZXF1aXJlZCBpcyBsaWJu
dW1hLnNvLjEsIGJ1dCB3aXRoIExJQk5VTUFfQVBJX1ZFUlNJT04gPj0gMi4KPiBUaGUgQVBJIHZl
cnNpb24gaXMgdGlnaHRlbiB0byBsaWJudW1hIHZlcnNpb24gaW4gZ2l0LCBidXQgdGhhdCBoYXMK
PiBub3RoaW5nIHRvIGRvIHdpdGggbGlicmFyeSBzb25hbWUgdmVyc2lvbiwgd2hpY2ggaXMgc3Rp
bGwgMS4wLjAuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+
Cj4gLS0tCj4gY29uZmlndXJlLmFjIHwgMiArLQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25m
aWd1cmUuYWMKPiBpbmRleCBlNDRlMjVjYzYuLjUyMWEyZTgzNSAxMDA2NDQKPiAtLS0gYS9jb25m
aWd1cmUuYWMKPiArKysgYi9jb25maWd1cmUuYWMKPiBAQCAtMzQ3LDcgKzM0Nyw3IEBAIExUUF9D
SEVDS19TWVNDQUxMX0ZDTlRMCj4gCj4gaWYgdGVzdCAieCR3aXRoX251bWEiID0geHllczsgdGhl
bgo+ICAgIExUUF9DSEVDS19TWVNDQUxMX05VTUEKPiAtICAgIG51bWFfZXJyb3JfbXNnPSJ0ZXN0
IHJlcXVpcmVzIGxpYm51bWEgPj0gMiBhbmQgaXQncyBkZXZlbG9wbWVudCBwYWNrYWdlcyIKPiAr
ICAgIG51bWFfZXJyb3JfbXNnPSJ0ZXN0IHJlcXVpcmVzIGxpYm51bWExIHdpdGggTElCTlVNQV9B
UElfVkVSU0lPTiA+PSAyIGFuZCBpdCdzIGRldmVsb3BtZW50IHBhY2thZ2VzIgo+IGVsc2UKPiAg
ICBudW1hX2Vycm9yX21zZz0iTlVNQSBzdXBwb3J0IHdhcyBkaXNhYmxlZCBkdXJpbmcgYnVpbGQi
Cj4gZmkKPiAtLSAKPiAyLjMwLjAKPiAKPiAKPiAtLSAKPiBNYWlsaW5nIGxpc3QgaW5mbzogaHR0
cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzog
aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
