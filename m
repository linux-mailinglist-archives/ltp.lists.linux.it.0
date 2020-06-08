Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D101F1874
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 14:06:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 594793C2E93
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 14:06:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id F23AF3C2029
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 14:06:48 +0200 (CEST)
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4C699600BDD
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 14:06:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Mime-Version:Message-ID:Subject:Date:From; bh=zf8sR
 E5zSPfvor9bymTLhksMtUSXiGqlqc1D72MqrNg=; b=mQYYb/0XX9drjnz1y/0gT
 6YKa2bH3ljNfXiy2tgz7Q7j7ngU2aAEAeVDgvN7gxxKcn23aBbo+4s8S1luzHdwf
 srFtQy5YZvIMNd5shB11aA1Miy3x3E7lWYqGqJpeFkPq2UOSIEjuv7DKy4+MAUQB
 0v6Ud74Q3fSQCxYiDELtkY=
Received: from localhost (unknown [223.104.148.218])
 by smtp13 (Coremail) with SMTP id EcCowACneTvNKd5eQ1OiGQ--.61637S2;
 Mon, 08 Jun 2020 20:06:38 +0800 (CST)
Mime-Version: 1.0
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
Message-ID: 
Date: Mon, 8 Jun 2020 20:06:35 +0800 (GMT+08:00)
From: =?UTF-8?B?eHV5YW5nX2p5XzA0MTBAMTYzLmNvbQ==?=<xuyang_jy_0410@163.com>
To: =?UTF-8?B?UGV0ciBWb3JlbA==?=<pvorel@suse.cz>,
 =?UTF-8?B?WWFuZyBYdQ==?=<xuyang2018.jy@cn.fujitsu.com>
X-CM-TRANSID: EcCowACneTvNKd5eQ1OiGQ--.61637S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFy8XF17XrWkGw1UWr4rZrb_yoW3Zrb_Cr
 W7Zw1vgayDXrs3Aw4akryDtr9Ika1xXF4ayr9xZrZ7JFs3Gry5XFykZr4jk3Z8t3WFv3Zr
 Jw4F9F9Y93WFkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb2g4PUUUUU==
X-Originating-IP: [223.104.148.218]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/xtbBdg49hFUMNY1NDAAAsh
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=3.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_EXCESS_BASE64,
 FROM_MISSP_FREEMAIL,HTML_MESSAGE,MIME_BASE64_TEXT,MIME_HTML_MOSTLY,
 MPART_ALT_DIFF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] LIB: Use INTERNAL_LIB for ltp lib
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
Cc: =?UTF-8?B??= <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1199286071=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1199286071==
Content-Type: multipart/alternative; 
	boundary="----=_Part_0_147806903.1591617996685"

------=_Part_0_147806903.1591617996685
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: base64


------=_Part_0_147806903.1591617996685
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IaSBwZXRyJm5ic3A7PC9kaXY+PGRpdj5qdXN0IHJlcGx5IGZvciB5b3VyIOKAnEdpdmVu
IEphbiBhY2tlZCB2MSwgSSdkIGJlIGFsc28gZm9yIG1lcmdl4oCd77yMIHYyIGlzIE9LLjwvZGl2
PjxkaXY+PGJyPjwvZGl2PjxkaXY+QmVzdCBSZWdhcmRzPC9kaXY+PGRpdj5ZYW5nIFh1PC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48IS0tZW1wdHlzaWduLS0+PC9kaXY+
PGRpdj48ZGl2IHN0eWxlPSJmb250LXNpemU6MTJweDtwYWRkaW5nOjJweCAwOyI+LS0tT3JpZ2lu
YWwtLS08L2Rpdj48ZGl2IHN0eWxlPSJmb250LXNpemU6MTJweDtiYWNrZ3JvdW5kOiNmMGYwZjA7
Y29sb3I6IzIxMjEyMTtwYWRkaW5nOjhweCFpbXBvcnRhbnQ7Ym9yZGVyLXJhZGl1czo0cHg7bGlu
ZS1oZWlnaHQ6MS41OyI+PGRpdj48Yj5Gcm9tOjwvYj4gIlBldHIgVm9yZWwiJmx0O3B2b3JlbEBz
dXNlLmN6Jmd0OzwvZGl2PjxkaXY+PGI+RGF0ZTo8L2I+IE1vbiwgSnVuIDgsIDIwMjAgMTk6NDEg
UE08L2Rpdj48ZGl2PjxiPlRvOjwvYj4gIllhbmcgWHUiJmx0O3h1eWFuZzIwMTguanlAY24uZnVq
aXRzdS5jb20mZ3Q7OzwvZGl2PjxkaXY+PGI+Q2M6PC9iPiAibHRwIiZsdDtsdHBAbGlzdHMubGlu
dXguaXQmZ3Q7OzwvZGl2PjxkaXY+PGI+U3ViamVjdDo8L2I+IFJlOiBbTFRQXSBbUEFUQ0ggdjJd
IExJQjogVXNlIElOVEVSTkFMX0xJQiBmb3IgbHRwIGxpYjwvZGl2PjwvZGl2Pjxicj5IaSZuYnNw
O1h1LDxicj48YnI+Jmd0OyZuYnNwOyZndDsmbmJzcDtDeXJpbCZuYnNwO2NvbmNlcm5lZCZuYnNw
OzNyZCZuYnNwO3BhcnR5Jm5ic3A7dXNlJm5ic3A7b2YmbmJzcDtsaWIvbGlibHRwLmEsJm5ic3A7
YnV0Jm5ic3A7bm9ib2R5Jm5ic3A7Y29tcGxhaW5lZC48YnI+Jmd0OyZuYnNwOyZndDsmbmJzcDtH
aXZlbiZuYnNwO0phbiZuYnNwO2Fja2VkJm5ic3A7djEsJm5ic3A7SSdkJm5ic3A7YmUmbmJzcDth
bHNvJm5ic3A7Zm9yJm5ic3A7bWVyZ2UuPGJyPjxicj4mZ3Q7Jm5ic3A7Jm5ic3A7V2UmbmJzcDth
bHNvJm5ic3A7c2hvdWxkJm5ic3A7aW5jbHVkZSZuYnNwO2FuZHJvaWRfbGlicHRocmVhZCZuYnNw
O2FuZCZuYnNwO2FuZHJvaWRfbGlicnQmbmJzcDtNYWtlZmlsZS48YnI+Tm90Jm5ic3A7c3VyZSZu
YnNwO3doYXQmbmJzcDt5b3UmbmJzcDttZWFuLiZuYnNwO1lvdSZuYnNwO2RpZCZuYnNwO3RoZSZu
YnNwO2NoYW5nZSZuYnNwO2luJm5ic3A7YW5kcm9pZF9saWJwdGhyZWFkJm5ic3A7YW5kPGJyPmFu
ZHJvaWRfbGlicnQmbmJzcDtNYWtlZmlsZSZuYnNwOyh0aGlzJm5ic3A7aXMmbmJzcDt2MiZuYnNw
O3RocmVhZCksJm5ic3A7dGh1cyZuYnNwO0kmbmJzcDtjb25zaWRlciZuYnNwO3RoaXMmbmJzcDtw
YXRjaCZuYnNwO3JlYWR5Ljxicj5PciZuYnNwO2FtJm5ic3A7SSZuYnNwO21pc3NpbmcmbmJzcDtz
b21ldGhpbmc/PGJyPjxicj5LaW5kJm5ic3A7cmVnYXJkcyw8YnI+UGV0cjxicj48YnI+LS0mbmJz
cDs8YnI+TWFpbGluZyZuYnNwO2xpc3QmbmJzcDtpbmZvOiZuYnNwO2h0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwPGJyPjwvZGl2Pg==
------=_Part_0_147806903.1591617996685--


--===============1199286071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1199286071==--

