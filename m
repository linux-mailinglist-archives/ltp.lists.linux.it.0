Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E953B7013
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 11:25:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED0963C6CB1
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 11:25:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DECEB3C1CC3
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 11:25:34 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CBFB61400E70
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 11:25:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1624958732; i=@fujitsu.com;
 bh=giv17xwMohwoJGhVfLE+uloN14VZV/l1mTcebZ0UAyQ=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=tGc6rCbyG13Koe0wyscZYU4zvPMFYBEKWwPKNPGuw5+goK9nou7oXp+c/3QwvYppN
 F6Vd+fQ717L3+mNsY9ytye+0bcyw5ZFMg71NXbiuXMlIvQlb69Zb1+gKH+vDU+eMQJ
 FsqccSYOT9eNHi4lE15E9zt4I+yz80i0akTRJs8Koh5TZerUOp0IwNFH8IZEcTYTCG
 p8CPKJMHUP2FMvbBBDyhGQaWwX7h4Lmpf0fjvHpGmT4aqRtx6lupgF9v2lp7QrWh3i
 QlsRrVHotYBRZxUfJz4V4um7AGdkBewnUq8/RBXnRutAscQQpqHfTmwiGW9s1kuvBg
 lmHDLx6PoO1ug==
Received: from [100.112.192.148] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 29/B5-11164-C07EAD06;
 Tue, 29 Jun 2021 09:25:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MRqsvz/Fa
 CwfQbEhYrvu9gdGD02Pd7HWsAYxRrZl5SfkUCa8alg4eYC45yVexfO5e5gfEIWxcjF4eQQAuT
 xMEr31ggnD2MEquWTwJyODnYBDQlnnUuYAaxRQQkJDoa3rKD2MwC6hLLJ/1iArGFBeIlbredA
 IuzCKhKnO2YCjSVg4NXwEPi000PkLCEgILElIfvwcbwCghKnJz5hAVijKZE6/bfUCPlJZq3zm
 aGqFeUuNTxjRHCrpCYMWMb2wRGvllI2mchaZ+FpH0BI/MqRvOkosz0jJLcxMwcXUMDA11DQyN
 dQ0sjXRMTvcQq3US91FLd8tTiEl1DvcTyYr3iytzknBS9vNSSTYzAYEwpOKCzg/Hnqw96hxgl
 OZiURHnnH7+VIMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCV/IpUE6wKDU9tSItMwcYGTBpCQ4eJ
 RHeSyBp3uKCxNzizHSI1ClGRSlx3nqQhABIIqM0D64NFo2XGGWlhHkZGRgYhHgKUotyM0tQ5V
 8xinMwKgnzyjwDmsKTmVcCN/0V0GImoMWLntwEWVySiJCSamByC2EOdb8uaeV0zZHJranS9dL
 +fQ/Efs5bElSQq/XMe0/gSlnNK4xTLdxPz7iy9tCvI5qrtfJOzM+ZVXX0bbGv8Ll6hqm6+W/n
 XC9bwXq57faDCeuuzptypilk3Tm2d+yZHctPX7kX/HG7tp+85Kb+QkfVFXNenClY8yacsW3BR
 veXny+GTTpftjZrpuKkPXyb8jt39zpoO3dzzRV6sjR7cnB6bb9zWd/cXRar+m3cpwZ9aPw17d
 0Lj5MXo2zD2q9rNL41PGP/1u2zZZ3urZZ1zpvm3Jx1efFz9Za+W2/ObBRbm8vxe5V60IvrzO4
 nz0Rwr3oXExlpcKuu3zbY7mSPzcXkn4qXPJ2feVb1G5zIU2Ipzkg01GIuKk4EAHZ/ACZBAwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-6.tower-267.messagelabs.com!1624958732!381929!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10382 invoked from network); 29 Jun 2021 09:25:32 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-6.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Jun 2021 09:25:32 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15T9PPF1019174
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 10:25:32 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 29 Jun 2021 10:25:23 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 29 Jun 2021 17:25:58 +0800
Message-ID: <1624958759-5562-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] include/tst_test_macro.h: Fix zero-length
 gnu_printf format string warning
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

V2hlbiBidWlsZCB0ZXN0X21hY3JvMDIuYywgaXQgcmVwb3J0cyB0aGUgZm9sbG93aW5nIHdhcm5p
bmcuCgpDQyBsaWIvbmV3bGliX3Rlc3RzL3Rlc3RfbWFjcm9zMDEKSW4gZmlsZSBpbmNsdWRlZCBm
cm9tIC4uLy4uL2luY2x1ZGUvdHN0X3Rlc3QuaDoyMSwKICAgICAgICAgICAgICAgICBmcm9tIHRl
c3RfbWFjcm9zMDIuYzoxMDoKdGVzdF9tYWNyb3MwMi5jOiBJbiBmdW5jdGlvbiDigJhkb190ZXN0
4oCZOgouLi8uLi9pbmNsdWRlL3RzdF90ZXN0X21hY3Jvcy5oOjE0MjozMTogd2FybmluZzogemVy
by1sZW5ndGggZ251X3ByaW50ZiBmb3JtYXQgc3RyaW5nIFstV2Zvcm1hdC16ZXJvLWxlbmd0aF0K
ICAxNDIgfCAgICAgVFNUX01TR18oVFBBU1MgfCBUVEVSUk5PLCAiIiwgICAgICAgICAgICAgICAg
ICBcCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn4KCkZpeCB0aGlzIGJ5
IGFkZGluZyBzcGFjZSBzdHJpbmcgaW4gZm9ybWF0IHdoZW4gdXNpbmcgVFNUX01TR18gbWFjcm8u
CgpTaWduZWQtb2ZmLWJ5OiBZYW5nIFh1IDx4dXlhbmcyMDE4Lmp5QGZ1aml0c3UuY29tPgotLS0K
IGluY2x1ZGUvdHN0X3Rlc3RfbWFjcm9zLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3RzdF90ZXN0X21h
Y3Jvcy5oIGIvaW5jbHVkZS90c3RfdGVzdF9tYWNyb3MuaAppbmRleCA3OGNlZTQ3ZGUuLjQxODg2
ZmJiYyAxMDA2NDQKLS0tIGEvaW5jbHVkZS90c3RfdGVzdF9tYWNyb3MuaAorKysgYi9pbmNsdWRl
L3RzdF90ZXN0X21hY3Jvcy5oCkBAIC0xMzksNyArMTM5LDcgQEAgZXh0ZXJuIHZvaWQgKlRTVF9S
RVRfUFRSOwogCQkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCiAJCWlmIChFUlJOTykgeyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKIAkJCWlmIChUU1RfRVJSID09IEVSUk5PKSB7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0JCQkJVFNUX01TR18oVFBBU1MgfCBU
VEVSUk5PLCAiIiwgICAgICAgICAgICAgICAgICBcCisJCQkJVFNUX01TR18oVFBBU1MgfCBUVEVS
Uk5PLCAiICIsICAgICAgICAgICAgICAgICBcCiAJCQkJICAgICAgICAgI1NDQUxMLCAjI19fVkFf
QVJHU19fKTsgICAgICAgICAgICAgICBcCiAJCQkJVFNUX1BBU1MgPSAxOyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCiAJCQl9IGVsc2UgeyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAotLSAKMi4yMy4wCgoKLS0gCk1haWxpbmcgbGlzdCBp
bmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
