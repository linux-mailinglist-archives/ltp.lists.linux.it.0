Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD5098ED7
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Aug 2019 11:12:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24EF93C1D09
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Aug 2019 11:12:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id B03703C1CF9
 for <ltp@lists.linux.it>; Thu, 22 Aug 2019 11:12:32 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9A35B1401118
 for <ltp@lists.linux.it>; Thu, 22 Aug 2019 11:12:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E3D51B066
 for <ltp@lists.linux.it>; Thu, 22 Aug 2019 09:12:30 +0000 (UTC)
Message-ID: <1566465150.3467.7.camel@suse.de>
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
Date: Thu, 22 Aug 2019 11:12:30 +0200
In-Reply-To: <20190820151831.7418-5-chrubis@suse.cz>
References: <20190820151831.7418-1-chrubis@suse.cz>
 <20190820151831.7418-5-chrubis@suse.cz>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 WEIRD_QUOTING autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/5] libs/libltpuinput: Add uinput library.
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
Reply-To: cfamullaconrad@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

On Tue, 2019-08-20 at 17:18 +0200, Cyril Hrubis wrote:
> I to be used in the uevent03 test.
> 
> Also I will convert the uinput testcases to new library and make use
> of
> this library as well.
> 
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  include/tst_uinput.h           |  48 +++++++++++
>  libs/libltpuinput/Makefile     |  12 +++
>  libs/libltpuinput/tst_uinput.c | 143
> +++++++++++++++++++++++++++++++++
>  3 files changed, 203 insertions(+)
>  create mode 100644 include/tst_uinput.h
>  create mode 100644 libs/libltpuinput/Makefile
>  create mode 100644 libs/libltpuinput/tst_uinput.c
> 
> diff --git a/include/tst_uinput.h b/include/tst_uinput.h
> new file mode 100644
> index 000000000..dddbd9921
> --- /dev/null
> +++ b/include/tst_uinput.h
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 Cyril Hrubis <chrubis@suse.cz>
> + */
> +
> +#ifndef TST_UINPUT_H__
> +#define TST_UINPUT_H__
> +
> +/**
> + * Tries to open the uinput device.
> + *
> + * Returns file descriptor on success, -1 on failure.
> + */
> +int open_uinput(void);
> +
> +/**
> + * Creates virtual input device.
> + *
> + * @fd File descriptor returned by open_uinput().
> + */
> +void create_input_device(int fd);
> +
> +/**
> + * Parses /proc/bus/input/devices and returns the handlers strings
> for our
> + * virtual device, which is list of input devices that receive
> events from the
> + * device separated by whitestpaces.
> + *
> + * Returns newly allocated string, list of handlers separated by
> whitespaces,
> + * or NULL in a case of failure.
> + */
> +char *get_input_handlers(void);
> +
> +/**
> + * Sets up the virtual device to appear as a mouse, this must be
> called before
> + * the call to create_input_device().
> + *
> + * @fd File descriptor as returned by open_uinput().
> + */
> +void setup_mouse_events(int fd);
> +
> +/**
> + * Destroys virtual input device.
> + *
> + * @fd File descriptor returned by open_uinput().
> + */
> +void destroy_input_device(int fd);
> +
> +#endif	/* TST_UINPUT_H__ */
> diff --git a/libs/libltpuinput/Makefile b/libs/libltpuinput/Makefile
> new file mode 100644
> index 000000000..dd2a6c096
> --- /dev/null
> +++ b/libs/libltpuinput/Makefile
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# Copyright (C) Cyril Hrubis <chrubis@suse.cz>
> +
> +top_srcdir		?= ../..
> +
> +include $(top_srcdir)/include/mk/env_pre.mk
> +
> +LIB			:= libltpuinput.a
> +
> +include $(top_srcdir)/include/mk/lib.mk
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/libs/libltpuinput/tst_uinput.c
> b/libs/libltpuinput/tst_uinput.c
> new file mode 100644
> index 000000000..61d06138e
> --- /dev/null
> +++ b/libs/libltpuinput/tst_uinput.c
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2015 Cedric Hnyda <chnyda@suse.com>
> + * Copyright (c) 2019 Cyril Hrubis <chrubis@suse.cz>
> + */
> +
> +#include <linux/input.h>
> +#include <linux/uinput.h>
> +#include <stdio.h>
> +#include <string.h>
> +
> +#define TST_NO_DEFAULT_MAIN
> +#include "tst_test.h"
> +
> +#include "tst_uinput.h"
> +
> +#define VIRTUAL_DEVICE "virtual-device-ltp"
> +
> +static const char *uinput_paths[] = {
> +	"/dev/input/uinput",
> +	"/dev/uinput",
> +};
> +
> +int open_uinput(void)
> +{
> +	unsigned int i;
> +	int fd;
> +
> +	for (i = 0; i < ARRAY_SIZE(uinput_paths); i++) {
> +		fd = open(uinput_paths[i], O_WRONLY | O_NONBLOCK);
> +
> +		if (fd > 0) {
> +			tst_res(TINFO, "Found uinput dev at %s",
> uinput_paths[i]);
> +			return fd;
> +		}
> +
> +		if (fd < 0 && errno != ENOENT) {
> +			tst_brk(TBROK | TERRNO, "open(%s)",
> uinput_paths[i]);
> +		}
> +	}
> +
> +	return -1;
> +}
> +
> +#define HANDLERS_PREFIX "Handlers="
> +
> +static char *parse_handlers(char *line)
> +{
> +	char *handlers;
> +
> +	handlers = strstr(line, HANDLERS_PREFIX) +
> sizeof(HANDLERS_PREFIX) - 1;
> +
> +	handlers[strlen(handlers) - 1] = 0;
> +
> +	return strdup(handlers);
> +}
> +
> +char *get_input_handlers(void)
> +{
> +	FILE *file;
> +	char line[1024];
> +	int flag = 0;
> +
> +	file = fopen("/proc/bus/input/devices", "r");
> +	if (!file)
> +		return NULL;
> +
> +	while (fgets(line, sizeof(line), file)) {
> +		if (strstr(line, "N: Name=\""VIRTUAL_DEVICE"\""))
> +			flag = 1;
> +
> +		if (flag) {
> +			if (line[0] == 'H')
> +				return parse_handlers(line);
> +
> +			if (line[0] == '\n')
> +				flag = 0;
> +		}
> +	}
> +
> +	fclose(file);
> +	return NULL;
> +}
> +
> +static int check_device(void)
> +{
> +	FILE *file;
> +	char line[256];
> +
> +	file = fopen("/proc/bus/input/devices", "r");
> +	if (!file)
> +		return 0;
> +
> +	while (fgets(line, 256, file)) {
                           ^maybe sizeof(line)

> +		if (strstr(line, VIRTUAL_DEVICE))
Could we get name clash and should check for Name="VIRTUAL_DEVICE" as
in get_input_handlers() ?

> +			return 1;
> +	}
> +
> +	fclose(file);
> +
> +	return 0;
> +}
> +
> +void setup_mouse_events(int fd)
> +{
> +	SAFE_IOCTL(fd, UI_SET_EVBIT, EV_KEY);
> +	SAFE_IOCTL(fd, UI_SET_KEYBIT, BTN_LEFT);
> +	SAFE_IOCTL(fd, UI_SET_EVBIT, EV_REL);
> +	SAFE_IOCTL(fd, UI_SET_RELBIT, REL_X);
> +	SAFE_IOCTL(fd, UI_SET_RELBIT, REL_Y);
> +}
> +
> +void destroy_input_device(int fd)
> +{
> +	SAFE_IOCTL(fd, UI_DEV_DESTROY, NULL);
> +	SAFE_CLOSE(fd);
> +}
> +
> +void create_input_device(int fd)
> +{
> +	int nb;
> +	struct uinput_user_dev uidev = {
> +		.name = VIRTUAL_DEVICE,
> +		.id = {
> +			.bustype = BUS_USB,
> +			.vendor = 0x1,
> +			.product = 0x1,
> +			.version = 1,
> +		}
> +	};
> +
> +	SAFE_WRITE(1, fd, &uidev, sizeof(uidev));
> +	SAFE_IOCTL(fd, UI_DEV_CREATE, NULL);
> +
> +	for (nb = 100; nb > 0; nb--) {
> +		if (check_device())
> +			return;
> +		usleep(10000);
> +	}
> +
> +	destroy_input_device(fd);
> +	tst_brk(TBROK, "Failed to create device");
> +}
> -- 
> 2.21.0
> 
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
