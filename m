Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C1E445F1B
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 05:22:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A2823C7596
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 05:22:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C6C013C7304
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 05:22:09 +0100 (CET)
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E4F451A0112F
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 05:22:08 +0100 (CET)
Received: by mail-io1-xd31.google.com with SMTP id v65so9412002ioe.5
 for <ltp@lists.linux.it>; Thu, 04 Nov 2021 21:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QU0tf/mIehXvAUouGPigwmi3No7DsauwsRsTMOmlGHM=;
 b=M4ecNYSubAk5rc6EcEu4UDCUi14b5lHO9RtFcIlqQBK49dAhnRqO5UD9npW3+Cf2/i
 bdCq6hYiIb1MxXTvdORAgI6sBgtjpuGOHq7p3f8JiNQmnQFZI7m5MohOyXLlWWgZh9mi
 FTpwT8wevBMQkwOYP/kEyhh/LPrDSCfwTBgzt6Jwm/1Pz96UzOFzolfFqnJ7utrP15vb
 fxVOx5uE+Gu95DqOOVRJO1WZybgl8aR+1juRJEGmFBjOfdPMFZ0j3F1hss1hoXN8wDy2
 xZs3jN93pVvT6ErmpVaQn9SO+lgeNHaI+pon9sE6Spbub3c703iASsbckna49meZrXi/
 GmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QU0tf/mIehXvAUouGPigwmi3No7DsauwsRsTMOmlGHM=;
 b=1BKLYIE0aLHHGWx1R4qolQIQnbYjwlu1UmHh2CEmxQoZxSTPaeAI1Zv0XfBd+/LReR
 LjUQfnCpUsmeVNVYyZBV7uXfcnLfeQ5cKiwUe0S3Qj+9Jg4W6szXlx6Q55S5CCZ9fBvE
 s5Dz0M3IPNKNPv81X0lgYhiLfT23UIEyqljmgt6sNwGfHow5y7TKG+RvjbW/51zMPqnl
 7BE0N8DPUvQg+CVwBa+j7lVRyezSuGKpOXddPmaAznUauqCXnkb4jzsQ9dJYwBoxnCOy
 JomM1EH31k1+uvXYwNF7Ob9qmEwXvnsAkkcpSBY2Gn9TWGZKRoCJrGD7hyo+Wu0wPkz9
 70NQ==
X-Gm-Message-State: AOAM532j0pecWPOAsTeiCe2a/ZsbjdZmwpc9EAVgI2v01d/b109k00k5
 anU1jEMHRq40n89ENiUPhLGYKuvfSScNXE2UmD8=
X-Google-Smtp-Source: ABdhPJzVf/FVrrYLJoU1NV98J7CK1eQyDzhRcZ4fJgnwCiz42Ca8mBNjCPDX7dBuEU4g7YojXzy1UbdWzacA5GQF0WU=
X-Received: by 2002:a05:6602:1583:: with SMTP id
 e3mr17006017iow.112.1636086127585; 
 Thu, 04 Nov 2021 21:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1635849607.git.repnop@google.com>
 <229fb61317343cf30d481d05da272657c7572f59.1635849607.git.repnop@google.com>
In-Reply-To: <229fb61317343cf30d481d05da272657c7572f59.1635849607.git.repnop@google.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 5 Nov 2021 06:21:56 +0200
Message-ID: <CAOQ4uxgphXO16-u2fsm9Ts4nxY3AzSPpyMbKMWb2AtWs2ASB7Q@mail.gmail.com>
To: Matthew Bobrowski <repnop@google.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/fanotify21: add new test checking
 the returned pidfd from fanotify in FAN_REPORT_PIDFD mode
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
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> +next_event:
> +               i += event->event_len;
> +               if (event->fd >= 0)
> +                       SAFE_CLOSE(event->fd);
> +
> +               if (info && info->pidfd >= 0)
> +                       SAFE_CLOSE(info->pidfd);
> +
> +               if (event_pidfd_fdinfo)
> +                       free(event_pidfd_fdinfo);

Need to reset event_pidfd_fdinfo = NULL
to avoid double free in do_cleanup

> +       }
> +}
> +
> +static void do_cleanup(void)
> +{
> +       if (fanotify_fd >= 0)
> +               SAFE_CLOSE(fanotify_fd);
> +
> +       if (self_pidfd_fdinfo)
> +               free(self_pidfd_fdinfo);
> +}
> +

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
