Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D4118BC43
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 17:18:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A5DB3C548E
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 17:18:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id CC3403C545A
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 17:18:39 +0100 (CET)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E75DB601490
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 17:18:38 +0100 (CET)
Received: by mail-pg1-x543.google.com with SMTP id z72so1534202pgz.3
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 09:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pIf6uSoRz1+q+8mNw6ttHgrC6r6Wt7qPrHniq8KwW0M=;
 b=lBopGgqHC3aSBxYnUm+I7ePkpNBP6vtB0U8JKmNiuPQqalGb61g4Al31j+7yAKMiXc
 KYGXgTqZc2k+8OQ4fo8kTRGvs+PcPqHHm71RV6yL+DGxfh0M0Zg6xNY09W2W0HTT2ed5
 asIqlaXSgVjF1BGBbOqh0GiWmwFsuOlbq040rk8MYlUkVic44CcjmPJv6mYRfp4+vv53
 7Bl472fCNBIxA8tWdzreqpZwtKUxum28qpWZ+RfXopABkCNR9RmvuS6tEw9mLCmpiwVu
 zCIcrUWNoQvlKlGKN4sz5a89Dty4g1pfTHZUWB1+/DwiA3vAvdsSoG7EgSv5854lh5sN
 1VdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pIf6uSoRz1+q+8mNw6ttHgrC6r6Wt7qPrHniq8KwW0M=;
 b=B/vi3T8vIxebWa04ZN9xtnLtVpDQlAQ82PfLpV2myqjsf2vcfs8V72ODrkJOBg5KhP
 JrWVpXRfX9o3WzeQrkrEZ2WLZbzhACGcC07P87AH/0sO6+JJX/hibTxTYQtaMgfLs86n
 U2zHxVgnCKT3b77SUFRwW45JsCwX0uA0MGd7keipRqGG3IiQnQSxMA+asybtRS2XekP4
 DGvIrtLQL3gqAajDQk6eHgyn41JBA+VVqKpxxaTAQtqVDgX+68OYXEL+zVFXCFXNxC1Y
 +s1SEkENs/yDLeEmC3MB5/jXOnN5OLC6aZWGIU/VoP3wz4+MySUzI0HADcCsUTU3XVnq
 U/Cw==
X-Gm-Message-State: ANhLgQ3gF7QgCjeHlgtcQtG+jT98PEeOppxwX5d55EP2WyAIKyqoBO8Z
 OZjT0L/n7h2Wy4ztEMOZ7wDW0FpG98M=
X-Google-Smtp-Source: ADFU+vvuIDOGczzPugK9ldrBLLQPkoqL9rweJIHb2RN6h+UFnsnRynGNiIFxyiSlW+IJlA8KV+Mltg==
X-Received: by 2002:a63:d255:: with SMTP id t21mr4034490pgi.114.1584634717477; 
 Thu, 19 Mar 2020 09:18:37 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id y18sm2822156pfe.19.2020.03.19.09.18.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Mar 2020 09:18:36 -0700 (PDT)
Date: Thu, 19 Mar 2020 21:48:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200319161834.4hdz4q75yyk4cfy2@vireshk-i7>
References: <cover.1584618969.git.viresh.kumar@linaro.org>
 <c64b9c05053d500a95cc920e332fa229085217b6.1584618969.git.viresh.kumar@linaro.org>
 <20200319230111.GC29386@yuki.lan>
 <20200319151956.3rwix5oint6cmt4f@vireshk-i7>
 <20200319232426.GD29386@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319232426.GD29386@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 2/2] syscalls/clone3: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 20-03-20, 00:24, Cyril Hrubis wrote:
> Huh? All that we have to is to move the code from the child_rx_signal()
> to the do_child() here, the child would setup a handler and call
> pause(), then it checks if correct values have been stored to a global
> varibles. And the same for the parent, the point is that we should do a
> minimal amount of work in the handler itself.

There is a problem with using pause() here.

Child is doing this:

static void do_child(int clone_pidfd, int n)
{
	SAFE_SIGACTION(CHILD_SIGNAL, &csig_action, NULL);

	TST_CHECKPOINT_WAKE(0);
	pause();
	TST_CHECKPOINT_WAIT(1);

	if (child_received_signal)
		tst_res(TPASS, "clone3() passed: Child received correct signal (index %d)", n);

        exit(0);
}

and parent:

        TST_CHECKPOINT_WAIT(0);

        TEST(pidfd_send_signal(pidfd, CHILD_SIGNAL, &uinfo, 0));
        if (TST_RET != 0) {
                tst_res(TFAIL | TTERRNO, "pidfd_send_signal() failed");
                return;
        }

        TST_CHECKPOINT_WAKE(1);


What's happening is that parent is able to send the signal before the
child calls pause() and so it hangs. If I simply remove pause() it all
works fine for me, but is pidfd_send_signal() synchronous ? Does it
wait until the time child signal is executed ? If yes, then we don't
have a problem, else we may run into timing issue.

We can add a delay in parent before sending the signal, but that is
still racy in worst cases.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
