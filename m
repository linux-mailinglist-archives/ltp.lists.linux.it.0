Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 950ED3B0676
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 16:06:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04D813C8E6A
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 16:06:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 96E5F3C229E
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 16:06:03 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id ED2A6600959
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 16:06:02 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 435FC1FD45;
 Tue, 22 Jun 2021 14:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624370762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5UYnxiuYP/BqH9oL5qgb4fjn76nWXZ4IOpefbXBSxN8=;
 b=AkOjinx2ZbS5CYvsLDkdPI0okZKhNms8eXtfQeVlquuPUJrwh1XYiLyg1qFd5iUh+94l9q
 0EvqYaZIBudtqLBWxaptis3g/Ubibp2LGZ/D3YBHbBJfsrIy47b/zlszvnYYN8T2CEPzLn
 7Kh+v991KBUCXNBfDCpctj6z6UYFX4I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624370762;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5UYnxiuYP/BqH9oL5qgb4fjn76nWXZ4IOpefbXBSxN8=;
 b=KJxSnbcjpO0MY/pciP8t002OonJFWs0bA64gCQOVIZq8D/sqCWZ/f6aKmncjq0vEZFBYYX
 2W1+fGTlmsiyXeBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 22666118DD;
 Tue, 22 Jun 2021 14:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624370762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5UYnxiuYP/BqH9oL5qgb4fjn76nWXZ4IOpefbXBSxN8=;
 b=AkOjinx2ZbS5CYvsLDkdPI0okZKhNms8eXtfQeVlquuPUJrwh1XYiLyg1qFd5iUh+94l9q
 0EvqYaZIBudtqLBWxaptis3g/Ubibp2LGZ/D3YBHbBJfsrIy47b/zlszvnYYN8T2CEPzLn
 7Kh+v991KBUCXNBfDCpctj6z6UYFX4I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624370762;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5UYnxiuYP/BqH9oL5qgb4fjn76nWXZ4IOpefbXBSxN8=;
 b=KJxSnbcjpO0MY/pciP8t002OonJFWs0bA64gCQOVIZq8D/sqCWZ/f6aKmncjq0vEZFBYYX
 2W1+fGTlmsiyXeBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 5uqJCEru0WB1TgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Tue, 22 Jun 2021 14:06:02 +0000
Date: Tue, 22 Jun 2021 15:40:27 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YNHoS1L+0toUtAWT@yuki>
References: <20210615074045.23974-1-rpalethorpe@suse.com>
 <20210615074045.23974-3-rpalethorpe@suse.com>
 <YMirQoiYRYsDP7Sb@yuki> <87czsk51fc.fsf@suse.de>
 <1e7ecce7-2e46-ea46-3c5b-357d53a238c3@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1e7ecce7-2e46-ea46-3c5b-357d53a238c3@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/3] API: Remove TST_ERR usage from
 rtnetlink/netdevice
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > The test author is guaranteed that the library will not set TST_ERR
> > except via the TEST macro and similar.
> 
> Hi, who decided to guarantee this and where is the guarantee documented?

That is the whole point of the API, keep TST_RET and TST_ERR until
explicitly changed by either chaning them directly or via the TEST()
macro.

> I was planning to document that RTNL_SEND_VALIDATE() and
> RTNL_CHECK_ACKS() will pass error codes found in rtnetlink ACK messages
> through TST_ERR.
> 
> On 17. 06. 21 10:40, Richard Palethorpe wrote:
> > Hello,
> > 
> > Cyril Hrubis <chrubis@suse.cz> writes:
> >> I do not like this fix. If nothing else it's fragile and would make any
> >> patch review for these libraries much harder.
> >>
> >> I would prefer having these functions modified to return the errors
> >> instead even if I have to do the work.
> 
> Changing the return value to always return errno will be a major PITA
> because 95% of error handling happens after some safe_syscall() which
> clobbers errno by calling tst_brk() after failure. And if you only want
> to return error codes from rtnetlink ACK messages, then there's the
> problem what to return when a safe_syscall() fails during cleanup().

For the current code it would be as easy as:

diff --git a/lib/tst_netdevice.c b/lib/tst_netdevice.c
index d098173d5..b4b10944d 100644
--- a/lib/tst_netdevice.c
+++ b/lib/tst_netdevice.c
@@ -148,10 +148,10 @@ int tst_create_veth_pair(const char *file, const int lineno,
        ret = tst_rtnl_send_validate(file, lineno, ctx);
        tst_rtnl_destroy_context(file, lineno, ctx);

-       if (!ret) {
-               tst_brk_(file, lineno, TBROK | TTERRNO,
-                       "Failed to create veth interfaces %s+%s", ifname1,
-                       ifname2);
+       if (ret) {
+               tst_brk_(file, lineno, TBROK,
+                       "Failed to create veth interfaces %s+%s: %s", ifname1,
+                       ifname2, tst_strerrno(ret));
        }

        return ret;
@@ -182,9 +182,9 @@ int tst_remove_netdev(const char *file, const int lineno, const char *ifname)
        ret = tst_rtnl_send_validate(file, lineno, ctx);
        tst_rtnl_destroy_context(file, lineno, ctx);

-       if (!ret) {
+       if (ret) {
                tst_brk_(file, lineno, TBROK | TTERRNO,
-                       "Failed to remove netdevice %s", ifname);
+                       "Failed to remove netdevice %s: %s", ifname, tst_strerrno(ret));
        }

        return ret;
@@ -231,9 +231,9 @@ static int modify_address(const char *file, const int lineno,
        ret = tst_rtnl_send_validate(file, lineno, ctx);
        tst_rtnl_destroy_context(file, lineno, ctx);

-       if (!ret) {
+       if (ret) {
                tst_brk_(file, lineno, TBROK | TTERRNO,
-                       "Failed to modify %s network address", ifname);
+                       "Failed to modify %s network address: %s", ifname, tst_strerrno(ret));
        }

        return ret;
@@ -300,9 +300,9 @@ static int change_ns(const char *file, const int lineno, const char *ifname,
        ret = tst_rtnl_send_validate(file, lineno, ctx);
        tst_rtnl_destroy_context(file, lineno, ctx);

-       if (!ret) {
+       if (ret) {
                tst_brk_(file, lineno, TBROK | TTERRNO,
-                       "Failed to move %s to another namespace", ifname);
+                       "Failed to move %s to another namespace: %s", ifname, tst_strerrno(ret));
        }

        return ret;
@@ -391,9 +391,9 @@ static int modify_route(const char *file, const int lineno, unsigned int action,
        ret = tst_rtnl_send_validate(file, lineno, ctx);
        tst_rtnl_destroy_context(file, lineno, ctx);

-       if (!ret) {
+       if (ret) {
                tst_brk_(file, lineno, TBROK | TTERRNO,
-                       "Failed to modify network route");
+                       "Failed to modify network route", tst_strerrno(ret));
        }

        return ret;
diff --git a/lib/tst_rtnetlink.c b/lib/tst_rtnetlink.c
index 1ecda3a9f..c5f1aa0dc 100644
--- a/lib/tst_rtnetlink.c
+++ b/lib/tst_rtnetlink.c
@@ -376,16 +376,14 @@ int tst_rtnl_check_acks(const char *file, const int lineno,
                        tst_brk_(file, lineno, TBROK,
                                "No ACK found for Netlink message %u",
                                msg->nlmsg_seq);
-                       return 0;
+                       return EPROTO;
                }

-               if (res->err->error) {
-                       TST_ERR = -res->err->error;
-                       return 0;
-               }
+               if (res->err->error)
+                       return res->err->error;
        }

-       return 1;
+       return 0;
 }

 int tst_rtnl_send_validate(const char *file, const int lineno,
@@ -394,8 +392,6 @@ int tst_rtnl_send_validate(const char *file, const int lineno,
        struct tst_rtnl_message *response;
        int ret;

-       TST_ERR = 0;
-
        if (tst_rtnl_send(file, lineno, ctx) <= 0)
                return 0;

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
