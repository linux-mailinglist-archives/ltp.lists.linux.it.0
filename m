Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AD92EF3A3
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Jan 2021 15:04:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4A11E3C3152
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Jan 2021 15:04:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 7C79D3C264E
 for <ltp@lists.linux.it>; Fri,  8 Jan 2021 15:04:02 +0100 (CET)
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A92721A00E72
 for <ltp@lists.linux.it>; Fri,  8 Jan 2021 15:04:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Mime-Version:Message-ID:Subject:Date:From; bh=q/KGi
 mfoYLXP1IYNGJrdvw/n+1vQujEkKvsq5LdYmaA=; b=GVFXh+WfKoJaeHv2QfbTP
 +AEeBhqhP6XWsdHR/mnnhKnV1+6DTfF4L7KBsTpHkxw+EexFR7B9rJhfKtKalOF0
 y9czEAS55oJbCI4wwbR6Awi7b50F0WfrUujq0YR+qiGq8zB8lRuXkqs89uVeGeGK
 2BCJV9uNATu3Hmj1Kxulp8=
Received: from localhost (unknown [117.136.66.101])
 by smtp10 (Coremail) with SMTP id DsCowADXrOhGZvhf6RVQfA--.32678S2;
 Fri, 08 Jan 2021 22:03:51 +0800 (CST)
Mime-Version: 1.0
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
Message-ID: 
Date: Fri, 8 Jan 2021 22:03:44 +0800 (GMT+08:00)
From: =?UTF-8?B?eHV5YW5nX2p5XzA0MTBAMTYzLmNvbQ==?=<xuyang_jy_0410@163.com>
To: =?UTF-8?B?Q3lyaWwgSHJ1Ymlz?=<chrubis@suse.cz>,
 =?UTF-8?B?WWFuZyBYdQ==?=<xuyang2018.jy@cn.fujitsu.com>
X-CM-TRANSID: DsCowADXrOhGZvhf6RVQfA--.32678S2
X-Coremail-Antispam: 1Uf129KBjvdXoW5tw48CFWfJw17WF4UCrWrGrg_yoWxXrc_ur
 W7Cwn7K34UKanFkw42vFs5CwsIkFy2q343JFZ7GF47ArsFqFnxKFWkGrZ3uw4UCr98KF45
 JF45Jry0vr13ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1ySoJUUUUU==
X-Originating-IP: [117.136.66.101]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/1tbiXAkUhFXlyYvQGgAAs9
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=3.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 FROM_EXCESS_BASE64,FROM_MISSP_FREEMAIL,HTML_MESSAGE,MIME_BASE64_TEXT,
 MIME_HTML_MOSTLY,MPART_ALT_DIFF,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] Holidays and LTP release
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
Content-Type: multipart/mixed; boundary="===============1281944767=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1281944767==
Content-Type: multipart/alternative; 
	boundary="----=_Part_0_84731298.1610114630731"

------=_Part_0_84731298.1610114630731
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: base64


------=_Part_0_84731298.1610114630731
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IaSBDeXJpbDwvZGl2PjxkaXY+Rm9yIGlvY3RsX2xvb3AwNSBjYXNl77yMIHlvdSBjYW4g
cHVzaCBpdCBkaXJlY3RseS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkJlc3QgUmVnYXJkczwv
ZGl2PjxkaXY+WWFuZyBYdTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PCEtLWVtcHR5c2lnbi0t
PjwvZGl2PjxkaXY+PGRpdiBzdHlsZT0iZm9udC1zaXplOjEycHg7cGFkZGluZzoycHggMDsiPi0t
LU9yaWdpbmFsLS0tPC9kaXY+PGRpdiBzdHlsZT0iZm9udC1zaXplOjEycHg7YmFja2dyb3VuZDoj
ZjBmMGYwO2NvbG9yOiMyMTIxMjE7cGFkZGluZzo4cHghaW1wb3J0YW50O2JvcmRlci1yYWRpdXM6
NHB4O2xpbmUtaGVpZ2h0OjEuNTsiPjxkaXY+PGI+RnJvbTo8L2I+ICJDeXJpbCBIcnViaXMiJmx0
O2NocnViaXNAc3VzZS5jeiZndDs8L2Rpdj48ZGl2PjxiPkRhdGU6PC9iPiBGcmksIEphbiA4LCAy
MDIxIDIxOjI4IFBNPC9kaXY+PGRpdj48Yj5Ubzo8L2I+ICJZYW5nIFh1IiZsdDt4dXlhbmcyMDE4
Lmp5QGNuLmZ1aml0c3UuY29tJmd0Ozs8L2Rpdj48ZGl2PjxiPkNjOjwvYj4gImx0cCImbHQ7bHRw
QGxpc3RzLmxpbnV4Lml0Jmd0Ozs8L2Rpdj48ZGl2PjxiPlN1YmplY3Q6PC9iPiBSZTogW0xUUF0g
SG9saWRheXMgYW5kIExUUCByZWxlYXNlPC9kaXY+PC9kaXY+PGJyPkhpITxicj4mZ3Q7Jm5ic3A7
V2UmbmJzcDtjYW4mbmJzcDthcHBseSZuYnNwO3BhdGNoWzFdJm5ic3A7ZGlzYWJsZXMmbmJzcDt0
aGUmbmJzcDt0ZXN0KGlvY3RsX2xvb3AwNSkmbmJzcDtvbiZuYnNwO292ZXJsYXkmbmJzcDtzbyZu
YnNwO3RoYXQmbmJzcDs8YnI+Jmd0OyZuYnNwO2l0J3MmbmJzcDtmaXhlZCZuYnNwO2ZvciZuYnNw
O25leHQmbmJzcDtyZWxlYXNlLjxicj48YnI+QWdyZWUsJm5ic3A7d2lsbCZuYnNwO3lvdSZuYnNw
O3B1c2gmbmJzcDtpdCZuYnNwO29yJm5ic3A7c2hvdWxkJm5ic3A7SSZuYnNwO2RvJm5ic3A7c28/
PGJyPjxicj4mZ3Q7Jm5ic3A7QWxzbywmbmJzcDtwbGVhc2UmbmJzcDtzZWUmbmJzcDtwYXRjaFsy
XSZuYnNwO2ZvciZuYnNwO2NwdV9pbmhlcml0Jm5ic3A7Zml4Ljxicj48YnI+SSZuYnNwO2xvb2tl
ZCZuYnNwO2F0Jm5ic3A7dGhhdCZuYnNwO29uZSZuYnNwO2FuZCZuYnNwO2Fja2VkJm5ic3A7aXQu
PGJyPjxicj4tLSZuYnNwOzxicj5DeXJpbCZuYnNwO0hydWJpczxicj5jaHJ1YmlzQHN1c2UuY3o8
YnI+PGJyPi0tJm5ic3A7PGJyPk1haWxpbmcmbmJzcDtsaXN0Jm5ic3A7aW5mbzombmJzcDtodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cDxicj48L2Rpdj4=
------=_Part_0_84731298.1610114630731--


--===============1281944767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1281944767==--

