Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F042E4CB67
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 11:57:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C20E92988E4
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 11:57:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C19272987A9
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 11:57:48 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9D5EA1401728
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 11:57:47 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id 19so1379209pfa.4
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 02:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mbobrowski-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=QlUaUdcNsZZVlzTCF6frkggAbClIotE/jTEQ4zOSrYQ=;
 b=n8lf8s9bIcLWwdLm5wkir+icnEJOAK7kK00b4WaPHxoDzsKCn6g3PYmdfP2boQuCkg
 sMVVYgdYGbbQucTthSJW8EiGkqXNMUjwiimAj2sTDMWpmx6A60IUj1XC7gOb2B3N/17Q
 ilFPStXZXWGmwe/UFBF0jyUTtBXmWYH8Lr7yu8/uQzmXuAzYowR/TrnA2xOdAKpB8A+k
 YHlu6G9bA346uy92FG7wohYbFprss1afsnM1635KpZZKL0uErNHbRgGOA9TMdPfQ3aLg
 G8GEsh30DJrATjMIDWj4Fp/ctoWdVi9iXsLcoiYxk5efwyIl2K6A7Y147VVEez8Hk/lE
 kPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=QlUaUdcNsZZVlzTCF6frkggAbClIotE/jTEQ4zOSrYQ=;
 b=XlgI3Ll5O0FCFmo9fuYcnxKrqNhg8KmPINp8NCD/xuFIefRtTqkWQAg1L8kdkOAY4W
 T/YPXlKLXRuj5z5xUUQrbN9TtE7CJ7DZH8rjKHVwpCFJPTfsWPTWg+0rJFMZCjXlbk0j
 sfaZ4LG0htgf4lja0OmtFzO+JdGPKxHlaTEddVXd24c1mkV6GLijgBo1aCaqRFYNsbMp
 vuVSuKWxRiEmTBjYuHB17wpsNBLiu/msjC9/bCLtyFsyLj4xsNTvGFyCiuMOpXWkMy8b
 k+yIjtEhH5Tv3HGJrUHbRCo2TPPCFSy7CWB2tPTOvZ1kWA8R4lcjY2IQWkW6zKkBlyz2
 n/KQ==
X-Gm-Message-State: APjAAAUReM7eupGZ/KK87UAS2RAhshmA43RO+J/pqDp0ZkGHLAsAKH8/
 ye/9RGZr78uf3zfb3cQhhXpcfm2CWA==
X-Google-Smtp-Source: APXvYqwYtzZAPIhjragREDlmU5j9NCk4PG9g8mdJpgDrUqTgm+47ppaCoPy2s/ucA6t/613FGtRT1w==
X-Received: by 2002:a17:90a:d151:: with SMTP id
 t17mr2222317pjw.60.1561024665452; 
 Thu, 20 Jun 2019 02:57:45 -0700 (PDT)
Received: from neo.Home ([114.78.0.167])
 by smtp.gmail.com with ESMTPSA id m41sm11490271pje.18.2019.06.20.02.57.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 02:57:44 -0700 (PDT)
Date: Thu, 20 Jun 2019 19:57:38 +1000
From: Matthew Bobrowski <mbobrowski@mbobrowski.org>
To: ltp@lists.linux.it
Message-ID: <cover.1561018312.git.mbobrowski@mbobrowski.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: jack@suse.cz
Subject: [LTP] [PATCH v5 0/4] syscalls/fanotify: FAN_REPORT_FID and
 Directory Modification Events
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

VGhpcyBwYXRjaCBzZXJpZXMgY29udGFpbnMgdGhlIGNoYW5nZXMgbmVlZGVkIHRvIHZhbGlkYXRl
IHRoZSBuZXcKRkFOX1JFUE9SVF9GSUQgZmxhZyBhbmQgZGlyZWN0b3J5IG1vZGlmaWNhdGlvbiBl
dmVudCBmdW5jdGlvbmFsaXR5CndpdGhpbiB0aGUgZmFub3RpZnkgQVBJLgoKQ2hhbmdlcyBzaW5j
ZSB2ZXJzaW9uIDQ6CgkqIEZpeGVkIHByb2JsZW1zIHdpdGggdW5iYWxhbmNlZCBmaWxlIGRlc2Ny
aXB0b3IgY2xvc2UuCgkqIFJlb3JkZWQgZnVuY3Rpb25zIGluIHRoZSB0ZXN0IGZpbGVzIGZhbm90
aWZ5MTMsIGZhbm90aWZ5MTQgYW5kCgkgIGZhbm90aWZ5MTUgc28gdGhhdCB0aGV5IGFsbCBmb2xs
b3cgYSBiYXNpYyB0ZW1wbGF0ZSBpLmUuCgoJICB0ZXN0KCkKCSAgLi4uCgkgIGRvX3NldHVwKCkK
CSAgZG9fY2xlYW51cCgpCgpUaGFuayB5b3UgQW1pciBmb3IgeW91ciBmZWVkYmFjay4gCgpBbWly
IEdvbGRzdGVpbiAoMSk6CiAgc3lzY2FsbHMvZmFub3RpZnkxMzogYWRkIHRlc3QgY292ZXJhZ2Ug
Zm9yIGZzaWQgY2FjaGUgYnVnCgpNYXR0aGV3IEJvYnJvd3NraSAoMyk6CiAgc3lzY2FsbHMvZmFu
b3RpZnkxMzogbmV3IHRlc3QgdG8gdmVyaWZ5IEZBTl9SRVBPUlRfRklEIGZ1bmN0aW9uYWxpdHkK
ICBzeXNjYWxscy9mYW5vdGlmeTE0OiBuZXcgdGVzdCB0byB2YWxpZGF0ZSBGQU5fUkVQT1JUX0ZJ
RCBpbnRlcmZhY2UKICAgIHJldHVybiB2YWx1ZXMKICBzeXNjYWxscy9mYW5vdGlmeTE1OiB2ZXJp
ZnkgZmlkIGZvciBkaXJlbnQgZXZlbnRzCgogY29uZmlndXJlLmFjICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDEgKwogcnVudGVzdC9zeXNjYWxscyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDMgKwogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5v
dGlmeS8uZ2l0aWdub3JlICAgfCAgIDMgKwogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5v
dGlmeS9mYW5vdGlmeS5oICAgfCAgODEgKysrKystCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L2Zhbm90aWZ5L2Zhbm90aWZ5MDUuYyB8ICAgMSArCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L2Zhbm90aWZ5L2Zhbm90aWZ5MTMuYyB8IDMyOCArKysrKysrKysrKysrKysrKysrKysrKysKIHRl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkxNC5jIHwgMTc2ICsrKysr
KysrKysrKysKIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkxNS5j
IHwgMjQ2ICsrKysrKysrKysrKysrKysrKwogOCBmaWxlcyBjaGFuZ2VkLCA4MzYgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkxNC5jCiBjcmVhdGUgbW9kZSAx
MDA2NDQgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTE1LmMKCi0t
IAoyLjE2LjQKCgotLSAKTWF0dGhldyBCb2Jyb3dza2kKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzog
aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
