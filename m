Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9178B3AC8B
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 02:26:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B4253EADC7
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 02:26:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 5D1D93EA5CE
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 02:26:23 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A95351400528
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 02:26:21 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id d126so4221647pfd.2
 for <ltp@lists.linux.it>; Sun, 09 Jun 2019 17:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KM+Uux7SJJn21/Sat1qQ2XRB9y7e8kAqW1uEsRYjlwA=;
 b=jSuzM5EIUYHlnh5pP9qlZ3AVh6DW/dHKKoXtdgyGICD8igrUB0ngSejd5CdhSZXVmQ
 OVZ4S/AvJvVIBUZUfRwGjQW6EsdOU++0KmV8Wfi77PDlUGeMnFsB/5Myt0QvD8MhGRZX
 bdcnrCHIcqno+HcojaF06iBwnwjjpUKuSvGIrupba1MNxuYyY7paExbwRJVw11wb1db/
 MrX+2O0cQBQDk0og0aLH/TbkmtxQOAiQ9qQrfgZu7rAGSD68Nul2AkGgnGuwYDwBx9CC
 okv0R8SZWCDmFRuTXInObHws6lmaNGGir6TMpNDSzLh6pnNM6MB9h3Hfq8O6NXy9IRY0
 SDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KM+Uux7SJJn21/Sat1qQ2XRB9y7e8kAqW1uEsRYjlwA=;
 b=mQS41r6eCxJvkE9HkHHsm/FTEIy8KCG5mcacwZ8DNQk4GvkwT2VXSEYyTNYWm+EJKG
 433g1IOCTKeqQQNmB6823n5fzad7WMarzOVA8Dxu+csLSV1EoUcRKSFrJJ/+2PN8jtYL
 iHNKmChkKPH9r5ny8TCZnlmdtF8VDgenNbkbI7ljn7qHeW4ndOcmUzdg3fJq1uf8tJmM
 aWgMbrThxltS4azzr6+Md+WoX192oa2uBZbzw2Dvfal/nnehvdktfPWy8QHxgAwYR6Cn
 APOF7KcckSvr6uLwEJtzJEhtVgmdFL7IiNlHryFHBEAjD5v9ENrcp2+lK0VvrqXIoOYI
 HQRA==
X-Gm-Message-State: APjAAAXCwOOtcXsA6/fl+WP6eBXL/8iolfLYgU+Ou/icRZGPmPCSu16J
 X/WbJLZH/ncXlYUezM0yYWwWGYKywTY=
X-Google-Smtp-Source: APXvYqz7JqB3rPjfSeEsgsaSxb4oJOGpb1bIhS23JYRCn3Y2i0NNvz9O1+dDRPXmr+cRQKeK63M94A==
X-Received: by 2002:aa7:8a87:: with SMTP id a7mr71893414pfc.53.1560126379791; 
 Sun, 09 Jun 2019 17:26:19 -0700 (PDT)
Received: from sspatil-glaptop2.roam.corp.google.com
 (c-73-170-36-70.hsd1.ca.comcast.net. [73.170.36.70])
 by smtp.gmail.com with ESMTPSA id 18sm5002405pfy.0.2019.06.09.17.26.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 17:26:19 -0700 (PDT)
From: Sandeep Patil <sspatil@android.com>
To: ltp@lists.linux.it
Date: Sun,  9 Jun 2019 17:26:07 -0700
Message-Id: <20190610002610.2187-1-sspatil@android.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com
Subject: [LTP] [PATCH v2 0/3] New library conversion for few system call
	tests
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

Rm9sbG93aW5nIHNlcmllcyBpcyBhIHNldCBvZiBzeXN0ZW0gY2FsbCB0ZXN0cyB0aGF0IGFyZSBj
b252ZXJ0ZWQgdG8gbmV3CmxpYnJhcnkuIEFsc28gZGVsZXRlZCBiZGZsdXNoIHRlc3QgYXQgdGhl
IHNhbWUgdGltZS4gSSBoYXZlIGJlZW4gZ29pbmcKdGhyb3VnaCB0aGUgc3lzdGVtIGNhbGwgdGVz
dHMgYWxwaGFiZXRpY2FsbHkgYW5kIGNvbnZlcnQgdGhlbSB0byBuZXcKbGlicmFyeSBhcyBhcHBs
aWNhYmxlLCBzbyB0aGVyZSB3aWxsIGJlIG1vcmUgdG8gY29tZS4KCkkgaGF2ZSB0ZXN0ZWQgdGhp
cyBvbiBjdXR0bGVmaXNoWzFdIGFuZCBtYWRlIHN1cmUgdGhleSBkb24ndCByZWdyZXNzLgoKMS4g
aHR0cHM6Ly9saW51eHBsdW1iZXJzY29uZi5vcmcvZXZlbnQvMi9jb250cmlidXRpb25zLzI2OS9h
dHRhY2htZW50cy81Ni82My9LZXJuZWxfSGFja2luZ193aXRoX0N1dHRsZWZpc2gucGRmCgpTYW5k
ZWVwIFBhdGlsICgzKToKICBzeXNjYWxscy9hZGp0aW1leDAyOiBDb252ZXJ0IHRvIG5ldyBsaWJy
YXJ5CiAgc3lzY2FsbHMvYXN5bmNpbzAyOiBjb252ZXJ0IHRvIG5ldyBsaWJyYXJ5LgogIHN5c2Nh
bGxzL2JpbmQwMTogY29udmVydCB0byBuZXcgbGlicmFyeS4KCiAuLi4va2VybmVsL3N5c2NhbGxz
L2FkanRpbWV4L2FkanRpbWV4MDIuYyAgICAgfCAzMTMgKysrKystLS0tLS0tLS0tLS0tCiB0ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL2FzeW5jaW8vLmdpdGlnbm9yZSAgfCAgIDEgLQogdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9hc3luY2lvL01ha2VmaWxlICAgIHwgIDIzIC0tCiB0ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL2FzeW5jaW8vYXN5bmNpbzAyLmMgfCAyOTQgLS0tLS0tLS0tLS0t
LS0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9iaW5kL2JpbmQwMS5jICAgICAgIHwgMTk4
ICsrKy0tLS0tLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N0YXQvc3RhdDAyLmMgICAg
ICAgfCAgOTMgKysrKysrCiA2IGZpbGVzIGNoYW5nZWQsIDIyMCBpbnNlcnRpb25zKCspLCA3MDIg
ZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9hc3luY2lvLy5naXRpZ25vcmUKIGRlbGV0ZSBtb2RlIDEwMDY0NCB0ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL2FzeW5jaW8vTWFrZWZpbGUKIGRlbGV0ZSBtb2RlIDEwMDY0NCB0ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2FzeW5jaW8vYXN5bmNpbzAyLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N0YXQvc3RhdDAyLmMKCi0tIAoyLjIyLjAucmMyLjM4
My5nZjRmYmJmMzBjMi1nb29nCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
